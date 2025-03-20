#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "DataManager.h"
#include "OrderModel.h"
#include "PortfolioManager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    DataManager dataManager;
    OrderModel orderModel;
    PortfolioManager portfolioManager;

    portfolioManager.initializeFunds(100000.0);

    engine.rootContext()->setContextProperty("dataManager", &dataManager);
    engine.rootContext()->setContextProperty("orderModel", &orderModel);
    engine.rootContext()->setContextProperty("portfolioManager", &portfolioManager);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);

    engine.loadFromModule("TradingProject", "Main");
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
