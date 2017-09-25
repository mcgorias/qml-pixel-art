#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "pixel.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<Pixel>("Pixels", 1, 0, "Pixel");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
