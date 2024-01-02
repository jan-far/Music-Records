#include "fileio.h"

Fileio::Fileio(QObject *parent)
    : QObject{parent}
    ,m_source("record.json")
{
    appLocation = QStandardPaths::standardLocations(QStandardPaths::AppDataLocation);
    qWarning() << "location: " << appLocation.first();
    this->read();
}

QString Fileio::source()
{
    return m_source;
}

QString Fileio::text()
{
    return m_text;
}

void Fileio::read()
{
    QFile file(m_source);

    if(!file.exists()) {
        file.open(QIODevice::NewOnly);
    } else {
        file.open(QIODevice::ReadOnly);
    }

    QTextStream stream(&file);
    m_text = stream.readAll();
    emit textChanged(m_text);
}

void Fileio::write()
{
    QFile file(m_source);
    if(file.open(QIODevice::WriteOnly)) {
        QTextStream stream(&file);
        stream << m_text;
        emit textChanged(m_text);
    }
}

void Fileio::setText(QString value)
{
    m_text = value;
}
