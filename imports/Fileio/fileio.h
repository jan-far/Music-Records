#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QQmlEngine>
#include <qqml.h>
#include <QStandardPaths>
#include <QStringList>
#include "QFile"
#include <QDir>

class Fileio : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString source READ source NOTIFY sourceChanged FINAL)
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged FINAL)
public:
    explicit Fileio(QObject *parent = nullptr);

    QString source();
    QString text();

    QStringList appLocation;

    Q_INVOKABLE void write();

signals:
    void sourceChanged();
    void textChanged(QString);

public slots:
    void setText(QString);

private:
    QString m_source;
    QString m_text;
    void read();
};


#endif // FILEIO_H
