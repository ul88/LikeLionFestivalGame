#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include"gameanswer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    GameAnswer gameAnswer;
    engine.rootContext()->setContextProperty("gameAnswer", &gameAnswer);

    engine.loadFromModule("TossGame", "Main");
    return app.exec();
}
