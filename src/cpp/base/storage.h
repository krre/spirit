#pragma once
#include <QtCore>

class Storage : public QObject
{
    Q_OBJECT
public:
    explicit Storage() {}
    void create(const QString& filePath);
private:
    QString filePath;
};
