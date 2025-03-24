#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QTimer>
#include <QVariantList>

class DataManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double currentPrice READ currentPrice NOTIFY currentPriceChanged)
    Q_PROPERTY(QString apiKey READ apiKey WRITE setApiKey NOTIFY apiKeyChanged)
    Q_PROPERTY(QString stockSymbol READ stockSymbol WRITE setStockSymbol NOTIFY stockSymbolChanged)
    Q_PROPERTY(QVariantList candleData READ candleData NOTIFY candleDataChanged)
    Q_PROPERTY(QString companyName READ companyName NOTIFY companyNameChanged)

public:
    explicit DataManager(QObject *parent = nullptr);
    double currentPrice() const { return m_currentPrice; }

    //Getter \ setter for apiKey
    QString apiKey() const { return m_apiKey; }
    void setApiKey(const QString &key) {
        m_apiKey = key;
        emit apiKeyChanged();

        fetchPrice();
        fetchCandlestickData();
        fetchCompanyName();
    }

    QString stockSymbol() const { return m_stockSymbol; }
    void setStockSymbol(const QString &symbol) {
        m_stockSymbol = symbol;
        emit stockSymbolChanged();

        fetchPrice();
        fetchCandlestickData();
        fetchCompanyName();
    }

    QVariantList candleData() const { return m_candleData; }
    QString companyName() const { return m_companyName; }

signals:
    void currentPriceChanged();
    void apiKeyChanged();
    void stockSymbolChanged();
    void candleDataChanged();
    void companyNameChanged();

public slots:
    void fetchPrice();
    void fetchCandlestickData();
    void fetchCompanyName();

private slots:
    void handleNetworkReply();

private:
    double m_currentPrice = 0.0;
    QNetworkAccessManager m_manager;
    QTimer m_timer;

    QString m_apiKey = "";
    QString m_stockSymbol = "AAPL";
    QVariantList m_candleData;
    QString m_companyName = "";
};

#endif
