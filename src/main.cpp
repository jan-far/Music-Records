// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "app_environment.h"
#include "import_qml_components_plugins.h"
#include "import_qml_plugins.h"
#include "imports/Fileio/fileio.h"

int main(int argc, char *argv[])
{
    set_qt_environment();

    QGuiApplication app(argc, argv);

    app.setOrganizationName("Farouk-Project");
    app.setApplicationDisplayName("Music Database");
    app.setApplicationName("Music Database");

    qmlRegisterType<Fileio>("Fileio", 1, 0, "Fileio");
//    qmlRegisterSingletonType(QUrl("qrc:/Music/Constants.qml"),"Constants", 1, 0,"Constants");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:qt/qml/Main/main.qml"_qs);
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qt/qml");
    engine.addImportPath(":/");

    engine.load(url);

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
