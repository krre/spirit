#include "brain.h"

void Brain::create(const QString& filePath)
{
    storage.create(filePath);
}

void Brain::start(const QString& filePath)
{
    this->filePath = filePath;
    m_logPath = logDir() + "/spirit-" + QDateTime::currentDateTimeUtc().toLocalTime().toString("yyyy-MM-dd") + ".log";
    logPathChanged(m_logPath);
    setIsRunning(true);
}

void Brain::stop()
{
    setIsRunning(false);
}

void Brain::run()
{
    setIsPaused(false);
}

void Brain::pause()
{
    setIsPaused(true);
}

void Brain::sendMessage(const QStringList& message)
{
    LOGGER() << "[RECEIVE] " << message;

    QStringList answer;
    answer << "I" << "receive" << "message";
    answered(answer);
    LOGGER() << "[SEND] " << message;
}

void Brain::setIsRunning(const bool isRunning)
{
    if (isRunning == m_isRunning) return;
    m_isRunning = isRunning;
    isRunningChanged(isRunning);

    if (isRunning) {
        LOGGER() << "Brain started";
    } else {
        LOGGER() << "Brain stopped";
    }
}

void Brain::setIsPaused(bool isPaused)
{
    if (m_isPaused == isPaused) return;
    m_isPaused = isPaused;
    emit isPausedChanged(isPaused);

    if (m_isPaused) {
        LOGGER() << "Brain paused";
    } else {
        LOGGER() << "Brain runned";
    }
}
