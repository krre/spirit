#include <QtCore>
#include <QtQml>
#include <QApplication>
#include "base/core.h"
#include "base/settings.h"
#include "base/brain.h"

QPointer<Brain> brain;

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);
    app.setApplicationName("Spirit");
    app.setApplicationVersion("0.1.0");

    Core core;
    ::brain = new Brain;
    QString filePath = qApp->applicationDirPath() + "/spirit.ini";
    Settings settings(filePath);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("Core", &core);
    engine.rootContext()->setContextProperty("Brain", brain);
    engine.rootContext()->setContextProperty("Settings", &settings);
    engine.load(QUrl("qrc:/qml/main.qml"));

    return app.exec();
}
