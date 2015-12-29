#include "storage.h"


void Storage::create(const QString& filePath)
{
    QFile file(filePath);
    if (!file.open(QIODevice::WriteOnly)) {
        qDebug() << "Could not open file for writing";
        return;
    }

    QDataStream out(&file);
    out << "Spirit";
    file.close();
}
