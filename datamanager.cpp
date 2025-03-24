#include "DataManager.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDateTime>
#include <QDebug>

DataManager::DataManager(QObject *parent) : QObject(parent)
{
    connect(&m_timer, &QTimer::timeout, this, &DataManager::fetchPrice);
    m_timer.start(60000); // Fetch every 60 seconds
}

void DataManager::fetchCompanyName()
{
    QString urlStr = QString("https://finnhub.io/api/v1/stock/profile2?symbol=%1&token=%2")
    .arg(m_stockSymbol)
        .arg(m_apiKey);
    qDebug() << "Company Profile URL:" << urlStr;

    QNetworkRequest request{ QUrl(urlStr) };
    QNetworkReply *reply = m_manager.get(request);

    connect(reply, &QNetworkReply::finished, [this, reply]() {
        if (reply->error() == QNetworkReply::NoError) {
            QByteArray data = reply->readAll();
            qDebug() << "Company Profile raw data:" << data;

            QJsonDocument doc = QJsonDocument::fromJson(data);
            if (!doc.isNull()) {
                QJsonObject obj = doc.object();
                QString name = obj.value("name").toString();

                if (!name.isEmpty()) {
                    // Valid company name found:
                    m_companyName = name;
                    emit companyNameChanged();

                    // Only now fetch quote and candlesticks:
                    fetchPrice();
                    fetchCandlestickData();
                } else {
                    // No "name" field => invalid ticker
                    m_companyName = "Couldn’t find that ticker";
                    emit companyNameChanged();

                    // Optionally clear out old data so the UI doesn't
                    // display stale price/candlesticks:
                    m_currentPrice = 0.0;
                    emit currentPriceChanged();
                    m_candleData.clear();
                    emit candleDataChanged();
                }
            } else {
                // JSON parse error
                m_companyName = "Error parsing profile response";
                emit companyNameChanged();
            }
        } else {
            // Network or other error
            m_companyName = "Network error: " + reply->errorString();
            emit companyNameChanged();
        }
        reply->deleteLater();
    });
}




void DataManager::fetchPrice()
{
    QString urlStr = QString("https://finnhub.io/api/v1/quote?symbol=%1&token=%2")
    .arg(m_stockSymbol, m_apiKey);

    qDebug() << "Requesting URL:" << urlStr;

    QUrl url(urlStr);
    QNetworkRequest request(url);
    QNetworkReply *reply = m_manager.get(request);
    connect(reply, &QNetworkReply::finished, this, &DataManager::handleNetworkReply);
}

void DataManager::handleNetworkReply()
{
    QNetworkReply *reply = qobject_cast<QNetworkReply *>(sender());
    if (!reply)
        return;

    if (reply->error() == QNetworkReply::NoError) {
        QByteArray data = reply->readAll();
        qDebug() << "API Response data:" << data;

        QJsonDocument doc = QJsonDocument::fromJson(data);
        if (!doc.isNull()) {
            QJsonObject obj = doc.object();
            if (obj.contains("c")) {
                m_currentPrice = obj.value("c").toDouble();
                emit currentPriceChanged();
            } else {
                qDebug() << "Unexpected Finnhub quote response:" << obj;
            }
        }
    } else {
        qDebug() << "Error fetching quote data:" << reply->errorString();
    }
    reply->deleteLater();
}

void DataManager::fetchCandlestickData()
{
    QDateTime now = QDateTime::currentDateTimeUtc();
    qint64 to = now.toSecsSinceEpoch();
    qint64 from = now.addDays(-30).toSecsSinceEpoch();

    QString urlStr = QString("https://finnhub.io/api/v1/stock/candle?symbol=%1&resolution=D&from=%2&to=%3&token=%4")
                         .arg(m_stockSymbol)
                         .arg(from)
                         .arg(to)
                         .arg(m_apiKey);

    qDebug() << "Candlestick URL:" << urlStr;

    QUrl url(urlStr);
    QNetworkRequest request(url);
    QNetworkReply *reply = m_manager.get(request);

    connect(reply, &QNetworkReply::finished, [this, reply]() {
        if (reply->error() == QNetworkReply::NoError) {
            QByteArray data = reply->readAll();
            qDebug() << "Candlestick data received:" << data;

            QJsonDocument doc = QJsonDocument::fromJson(data);
            QJsonObject obj = doc.object();

            if (obj.value("s").toString() == "ok") {
                QJsonArray opens = obj.value("o").toArray();
                QJsonArray highs = obj.value("h").toArray();
                QJsonArray lows = obj.value("l").toArray();
                QJsonArray closes = obj.value("c").toArray();
                int count = opens.size();

                QVariantList candleList;
                for (int i = 0; i < count; i++) {
                    QVariantMap candle;
                    candle["open"] = opens[i].toDouble();
                    candle["high"] = highs[i].toDouble();
                    candle["low"] = lows[i].toDouble();
                    candle["close"] = closes[i].toDouble();
                    candleList.append(candle);
                }

                m_candleData = candleList;
                emit candleDataChanged();
            } else {
                qDebug() << "Candlestick error response:" << obj;
            }
        } else {
            qDebug() << "Error fetching candlestick data:" << reply->errorString();
        }
        reply->deleteLater();
    });
}
