#pragma once
#include <QtCore>
#include "storage.h"

class Brain : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isRunning READ isRunning NOTIFY isRunningChanged)
    Q_PROPERTY(bool isPaused READ isPaused WRITE setIsPaused NOTIFY isPausedChanged)
public:
    Brain() {}
    Q_INVOKABLE void create(const QString& filePath);
    Q_INVOKABLE void start(const QString& filePath);
    Q_INVOKABLE void stop();
    Q_INVOKABLE void run();
    Q_INVOKABLE void pause();

    Q_INVOKABLE void sendMessage(const QStringList& message);

    isRunning() const { return m_isRunning; }
    void setIsRunning(const bool isRunning);

    isPaused() const { return m_isPaused; }
    void setIsPaused(bool isPaused);

signals:
    void isRunningChanged(bool isRunning);
    void isPausedChanged(bool isPaused);
    void answered(QStringList answer);

private:
    Storage storage;
    QString filePath;
    bool m_isRunning = false;
    bool m_isPaused = false;
};
