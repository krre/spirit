#include "storage.h"

void Storage::create(const QString& filePath)
{
    QFile file(filePath);
    if (!file.open(QIODevice::Append)) {
        qDebug() << "Could not open file for writing";
        return;
    }

    QDataStream out(&file);
    out.writeRawData("Spirit", 6);
    file.close();
}
