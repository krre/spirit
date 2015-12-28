#include "core.h"

Core::Core(QObject* parent) : QObject(parent)
{

}

QString Core::pathToBaseName(const QString& path)
{
    QFileInfo fileInfo(path);
    return fileInfo.baseName();
}

bool Core::isFileExists(const QString& filePath)
{
    QFileInfo checkFile(filePath);
    return checkFile.exists() && checkFile.isFile();
}

bool Core::removeFile(const QString& filePath)
{
    return QFile::remove(filePath);
}

void Core::mkpath(const QString &dirPath) {
    QDir dir;
    dir.mkpath(dirPath);
}
