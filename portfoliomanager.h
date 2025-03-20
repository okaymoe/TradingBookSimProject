#ifndef PORTFOLIOMANAGER_H
#define PORTFOLIOMANAGER_H

#include <QObject>
#include <QMap>
#include <QString>
#include <QVariantList>

struct Holding {
    QString symbol;
    int quantity;
    double averagePrice; // cost basis
};

class PortfolioManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double totalFunds READ totalFunds NOTIFY totalFundsChanged)
public:
    explicit PortfolioManager(QObject *parent = nullptr);

    double totalFunds() const { return m_totalFunds; }

    //initialize the user's funds
    Q_INVOKABLE void initializeFunds(double amount);

    // place an order (Buy/Sell) that updates funds and holdings
    Q_INVOKABLE void placeOrder(const QString &symbol, int quantity, double price, const QString &orderType);

    // return the current holdings as a QVariantList
    Q_INVOKABLE QVariantList holdingsList() const;

signals:
    void totalFundsChanged();
    void holdingsChanged();

private:
    double m_totalFunds;
    QMap<QString, Holding> m_holdings;
};

#endif
