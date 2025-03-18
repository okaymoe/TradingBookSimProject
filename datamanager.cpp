#include "DataManager.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>

DataManager::DataManager(QObject *parent) : QObject(parent)
{
    // Poll the API every 60 seconds (adjust as needed)
    connect(&m_timer, &QTimer::timeout, this, &DataManager::fetchPrice);
    m_timer.start(60000); // 60 seconds

    // Initial fetch
    fetchPrice();
}

void DataManager::fetchPrice()
{
    // Replace SYMBOL with the stock symbol (e.g., AAPL) and YOUR_API_KEY with your Alpha Vantage key
    QUrl url("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=AAPL&apikey=YOUR_API_KEY");
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
        QJsonDocument doc = QJsonDocument::fromJson(data);
        if (!doc.isNull()) {
            QJsonObject obj = doc.object();
            // Alpha Vantage returns a nested object under "Global Quote"
            QJsonObject quote = obj.value("Global Quote").toObject();
            if (!quote.isEmpty()) {
                // The price is typically under "05. price"
                m_currentPrice = quote.value("05. price").toString().toDouble();
                emit currentPriceChanged();
            }
        }
    }
    reply->deleteLater();
}
