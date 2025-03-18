#ifndef TRADINGENGINE_H
#define TRADINGENGINE_H

#include <QObject>
#include <QTimer>

class TradingEngine : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double price READ price NOTIFY priceChanged)
public:
    explicit TradingEngine(QObject *parent = nullptr);

    double price() const { return m_price; }

public slots:
    void simulateTrade();  // Can be called from QML to simulate a trade update

signals:
    void priceChanged();

private slots:
    void updatePrice();

private:
    double m_price;
    QTimer m_timer;
};

#endif // TRADINGENGINE_H
