#include "brain.h"

Brain::Brain(QObject *parent) : QObject(parent)
{

}

void Brain::create(const QString& filePath)
{
    storage.create(filePath);
}

void Brain::start(const QString& filePath)
{
    this->filePath = filePath;
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

void Brain::setIsRunning(const bool isRunning)
{
    if (isRunning == m_isRunning) return;
    m_isRunning = isRunning;
    isRunningChanged(isRunning);

    if (isRunning) {
        qDebug() << "Brain started" << filePath;
    } else {
        qDebug() << "Brain stopped" << filePath;
    }
}

void Brain::setIsPaused(bool isPaused)
{
    if (m_isPaused == isPaused) return;
    m_isPaused = isPaused;
    emit isPausedChanged(isPaused);

    if (m_isPaused) {
        qDebug() << "Brain paused" << filePath;
    } else {
        qDebug() << "Brain runned" << filePath;
    }
}
