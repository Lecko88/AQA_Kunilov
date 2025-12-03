#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFontDatabase>
#include "backend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Backend backend;

    QQmlApplicationEngine engine;
    /*const QString fontPath = QCoreApplication::applicationDirPath() + "/fonts/";
    QFontDatabase::addApplicationFont(fontPath + "Roboto-Regular.ttf");

    app.setFont(QFont("Roboto"));*/

    engine.rootContext()->setContextProperty("backend",&backend);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("AQA_Kunilov", "Main");

    return app.exec();
}
