#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "TradingEngine.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Register TradingEngine so it can be used in QML as TradingProject.TradingEngine
    qmlRegisterType<TradingEngine>("TradingProject", 1, 0, "TradingEngine");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("TradingProject", "Main");

    return app.exec();
}
