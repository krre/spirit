#pragma once
#include <QtCore>

class FileWatcher : public QFileSystemWatcher
{
    Q_OBJECT
    Q_PROPERTY(QString dirPath READ dirPath WRITE setDirPath NOTIFY dirPathChanged)
    Q_PROPERTY(QString filePath READ filePath WRITE setFilePath NOTIFY filePathChanged)
public:
    FileWatcher() {}

    QString dirPath() const { return m_dirPath; }
    void setDirPath(const QString& dirPath);

    QString filePath() const { return m_filePath; }
    void setFilePath(const QString& filePath);

signals:
    void dirPathChanged(QString dirPath);
    void filePathChanged(QString filePath);

private:
    QString m_dirPath;
    QString m_filePath;
};
