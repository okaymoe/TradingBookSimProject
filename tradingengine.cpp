#include "TradingEngine.h"
#include <QRandomGenerator>

TradingEngine::TradingEngine(QObject *parent)
    : QObject(parent), m_price(100.0)  // starting price
{
    // Update price automatically every second
    connect(&m_timer, &QTimer::timeout, this, &TradingEngine::updatePrice);
    m_timer.start(1000);
}

void TradingEngine::simulateTrade()
{
    // Manual trigger for a trade update (can be connected to a QML button)
    updatePrice();
}

void TradingEngine::updatePrice()
{
    // Simulate a price change with a random variation in the range [-1, 1]
   double delta = QRandomGenerator::global()->bounded(2.0) - 1.0;
    m_price += delta;
    emit priceChanged();
}
