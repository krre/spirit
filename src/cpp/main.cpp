#include <QtCore>
#include <QtQml>
#include <QApplication>
#include "base/core.h"

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);
    app.setApplicationName("Spirit");
    app.setApplicationVersion("0.1.0");

    Core core;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("Core", &core);
    engine.load(QUrl("qrc:/qml/main.qml"));

    return app.exec();
}
