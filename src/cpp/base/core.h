#pragma once
#include <QtCore>

class Core : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString buildDate READ buildDate CONSTANT)
    Q_PROPERTY(QString qtVersion READ qtVersion CONSTANT)
    Q_PROPERTY(QString homePath READ homePath CONSTANT)
    Q_PROPERTY(QChar separator READ separator CONSTANT)

public:
    explicit Core(QObject* parent = 0);
    QString buildDate() { return QString(__DATE__); }
    QString qtVersion() { return QT_VERSION_STR; }
    Q_INVOKABLE QString urlToPath(const QUrl& url) { return url.toLocalFile(); }
    Q_INVOKABLE QString urlToFileName(const QUrl& url) { return url.fileName(); }
    Q_INVOKABLE QUrl pathToUrl(const QString& path) { return QUrl::fromLocalFile(path); }
    Q_INVOKABLE QString pathToBaseName(const QString& path);
    QString homePath() { return QStandardPaths::writableLocation(QStandardPaths::HomeLocation); }
    Q_INVOKABLE bool isFileExists(const QString& filePath);
    Q_INVOKABLE bool removeFile(const QString& filePath);
    Q_INVOKABLE QChar separator() { return QDir::separator(); }
    Q_INVOKABLE void mkpath(const QString& dirPath);

};
