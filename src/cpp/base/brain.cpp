#include "brain.h"

Brain::Brain(QObject *parent) : QObject(parent)
{

}

void Brain::run(const QString& filePath)
{
    isRunning = true;
    qDebug() << "Brain run with" << filePath;
    this->filePath = filePath;
}

void Brain::stop()
{
    if (isRunning) {
        isRunning = false;
        qDebug() << "Brain stopped" << filePath;
    }
}
