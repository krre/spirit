#pragma once
#include <QtCore>

class Storage : public QObject
{
    Q_OBJECT
public:
    explicit Storage() {}
    Q_INVOKABLE void create(const QString& filePath);
};
