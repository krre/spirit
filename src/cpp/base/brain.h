#pragma once
#include <QtCore>
#include "storage.h"

class Brain : public QObject
{
    Q_OBJECT
public:
    explicit Brain(QObject *parent = 0);
    Q_INVOKABLE void create(const QString& filePath);
    Q_INVOKABLE void run(const QString& filePath);
    Q_INVOKABLE void stop();

private:
    Storage storage;
    QString filePath;
    bool isRunning = false;
};
