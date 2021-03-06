#include "logger.h"
#include "brain.h"

extern QPointer<Brain> brain;

Logger& Logger::instance()
{
    static Logger logger;
    return logger;
}

void Logger::Helper::write() {

    QString text;
    QTextStream ts(&text);
    ts << QDateTime::currentDateTimeUtc().toLocalTime().toString("yyyy-MM-dd hh:mm:ss.zzz") << ": ";
    ts << buffer.trimmed() << "\n";

    QFile data(brain->logPath());
    if (data.open(QFile::WriteOnly | QIODevice::Append)) {
        QTextStream out(&data);
        out << text;
        out.flush();
    }
}
