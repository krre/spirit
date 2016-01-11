#include "filewatcher.h"

void FileWatcher::setDirPath(const QString& dirPath)
{
    if (m_dirPath == dirPath) return;
    m_dirPath = dirPath;
    addPath(dirPath);
    emit dirPathChanged(dirPath);
}

void FileWatcher::setFilePath(const QString& filePath)
{
    if (m_filePath == filePath) return;
    m_filePath = filePath;
    addPath(filePath);
    emit filePathChanged(filePath);
}
