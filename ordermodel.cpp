#include "OrderModel.h"

OrderModel::OrderModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int OrderModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_orders.count();
}

QVariant OrderModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() < 0 || index.row() >= m_orders.count())
        return QVariant();

    const Order &order = m_orders.at(index.row());
    switch (role) {
    case SymbolRole: return order.symbol;
    case QuantityRole: return order.quantity;
    case OrderTypeRole: return order.orderType;
    case PriceRole: return order.price;
    default: return QVariant();
    }
}

QHash<int, QByteArray> OrderModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[SymbolRole] = "symbol";
    roles[QuantityRole] = "quantity";
    roles[OrderTypeRole] = "orderType";
    roles[PriceRole] = "price";
    return roles;
}

void OrderModel::addOrder(const QString &symbol, int quantity, const QString &orderType, double price) {
    beginInsertRows(QModelIndex(), m_orders.count(), m_orders.count());
    m_orders.append({symbol, quantity, orderType, price});
    endInsertRows();
}
