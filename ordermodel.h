#ifndef ORDERMODEL_H
#define ORDERMODEL_H

#include <QAbstractListModel>
#include <QString>
#include <QList>

struct Order {
    QString symbol;
    int quantity;
    QString orderType;
    double price;
};

class OrderModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum OrderRoles {
        SymbolRole = Qt::UserRole + 1,
        QuantityRole,
        OrderTypeRole,
        PriceRole
    };

    explicit OrderModel(QObject *parent = nullptr);

    // Overrides
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    // Q_INVOKABLE 2 add 2 orders
    Q_INVOKABLE void addOrder(const QString &symbol, int quantity, const QString &orderType, double price);

private:
    QList<Order> m_orders;
};

#endif
