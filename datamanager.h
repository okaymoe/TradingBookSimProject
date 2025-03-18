#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QTimer>

class DataManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double currentPrice READ currentPrice NOTIFY currentPriceChanged)
public:
    explicit DataManager(QObject *parent = nullptr);
    double currentPrice() const { return m_currentPrice; }

signals:
    void currentPriceChanged();

public slots:
    void fetchPrice();

private slots:
    void handleNetworkReply();

private:
    double m_currentPrice = 0.0;
    QNetworkAccessManager m_manager;
    QTimer m_timer;
};

#endif
