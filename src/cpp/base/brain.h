#pragma once
#include <QtCore>

class Brain : public QObject
{
    Q_OBJECT
public:
    explicit Brain(QObject *parent = 0);
    Q_INVOKABLE void run(const QString& filePath);
    Q_INVOKABLE void stop();

private:
    QString filePath;
    bool isRunning = false;
};
