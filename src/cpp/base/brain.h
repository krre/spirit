#pragma once
#include <QtCore>
#include "storage.h"
#include "core.h"
#include "logger.h"

class Brain : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isRunning READ isRunning NOTIFY isRunningChanged)
    Q_PROPERTY(bool isPaused READ isPaused WRITE setIsPaused NOTIFY isPausedChanged)
    Q_PROPERTY(QString logPath READ logPath NOTIFY logPathChanged)
public:
    Brain() {}
    Q_INVOKABLE void create(const QString& filePath);
    Q_INVOKABLE void start(const QString& filePath);
    Q_INVOKABLE void stop();
    Q_INVOKABLE void run();
    Q_INVOKABLE void pause();

    Q_INVOKABLE void sendMessage(const QStringList& message);

    bool isRunning() const { return m_isRunning; }
    void setIsRunning(const bool isRunning);

    bool isPaused() const { return m_isPaused; }
    void setIsPaused(bool isPaused);

    Q_INVOKABLE QString logDir() const { return Core::pathToDir(filePath) + "/log"; }
    Q_INVOKABLE QString logPath() const { return m_logPath; }

signals:
    void isRunningChanged(bool isRunning);
    void isPausedChanged(bool isPaused);
    void answered(QStringList answer);
    void logPathChanged(QString logPath);

private:
    Storage storage;
    QString filePath;
    bool m_isRunning = false;
    bool m_isPaused = false;
    QString m_logPath;
};
