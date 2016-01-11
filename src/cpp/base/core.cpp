#include "core.h"

Core::Core(QObject* parent) : QObject(parent)
{

}

QString Core::pathToBaseName(const QString& path)
{
    QFileInfo fileInfo(path);
    return fileInfo.baseName();
}

QString Core::pathToDir(const QString &path)
{
    QFileInfo fileInfo(path);
    return fileInfo.dir().absolutePath();
}

bool Core::isFileExists(const QString& filePath)
{
    QFileInfo checkFile(filePath);
    return checkFile.exists() && checkFile.isFile();
}

bool Core::isDirectoryExists(const QString &dirPath)
{
    QDir dir(dirPath);
    return dir.exists();
}

bool Core::removeFile(const QString& filePath)
{
    return QFile::remove(filePath);
}

void Core::mkpath(const QString &dirPath) {
    QDir dir;
    dir.mkpath(dirPath);
}

void Core::saveList(const QString& filePath, const QStringList& list)
{
    QFile file(filePath);
    if (file.open(QFile::WriteOnly | QFile::Text)) {
        QTextStream stream(&file);
        for (int i = 0; i < list.size(); ++i) {
            stream << list.at(i) << '\n';
        }
    } else {
        qDebug() << "Error opening file";
    }
    file.close();
}

QStringList Core::loadList(const QString& filePath)
{
    QStringList list;
    QFile file(filePath);
    if (file.open(QFile::ReadOnly | QFile::Text)) {
        QTextStream stream(&file);
        while (!stream.atEnd()) {
            list += stream.readLine();
        }
        return list;
    } else {
        return QStringList();
    }
}
