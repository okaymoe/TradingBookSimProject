#include "PortfolioManager.h"
#include <QDebug>

PortfolioManager::PortfolioManager(QObject *parent)
    : QObject(parent), m_totalFunds(0.0)
{
}

void PortfolioManager::initializeFunds(double amount)
{
    m_totalFunds = amount;
    emit totalFundsChanged();
}

void PortfolioManager::placeOrder(const QString &symbol, int quantity, double price, const QString &orderType)
{
    if (orderType == "Buy") {
        double cost = price * quantity;
        if (cost > m_totalFunds) {
            qDebug() << "Not enough funds!";
            return;
        }
        m_totalFunds -= cost;
        if (!m_holdings.contains(symbol)) {
            Holding h;
            h.symbol = symbol;
            h.quantity = quantity;
            h.averagePrice = price;
            m_holdings.insert(symbol, h);
        } else {
            Holding &h = m_holdings[symbol];
            double totalCostBefore = h.averagePrice * h.quantity;
            double totalCostNow = price * quantity;
            h.quantity += quantity;
            h.averagePrice = (totalCostBefore + totalCostNow) / h.quantity;
        }
    } else if (orderType == "Sell") {
        if (!m_holdings.contains(symbol)) {
            qDebug() << "No holdings for" << symbol;
            return;
        }
        Holding &h = m_holdings[symbol];
        if (quantity > h.quantity) {
            qDebug() << "Not enough shares to sell!";
            return;
        }
        double proceeds = price * quantity;
        m_totalFunds += proceeds;
        h.quantity -= quantity;
        if (h.quantity == 0)
            m_holdings.remove(symbol);
    }

    emit totalFundsChanged();
    emit holdingsChanged();
    qDebug() << "Order placed:" << orderType << quantity << symbol << "@ $" << price;
}

QVariantList PortfolioManager::holdingsList() const
{
    QVariantList list;
    for (auto it = m_holdings.begin(); it != m_holdings.end(); ++it) {
        QVariantMap holdingMap;
        holdingMap["symbol"] = it.value().symbol;
        holdingMap["quantity"] = it.value().quantity;
        holdingMap["averagePrice"] = it.value().averagePrice;
        list.append(holdingMap);
    }
    return list;
}
