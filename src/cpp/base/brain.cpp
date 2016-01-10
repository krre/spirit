#include "brain.h"

Brain::Brain(QObject *parent) : QObject(parent)
{

}

void Brain::create(const QString& filePath)
{
    storage.create(filePath);
}

void Brain::run(const QString& filePath)
{
    isRunning = true;
    qDebug() << "Brain runned" << filePath;
    this->filePath = filePath;
}

void Brain::stop()
{
    if (isRunning) {
        isRunning = false;
        qDebug() << "Brain stopped" << filePath;
    }
}
