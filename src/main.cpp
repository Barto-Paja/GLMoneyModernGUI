// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QLocale>

#include "app_environment.h"
#include "import_qml_plugins.h"

#include "databasecursor.hpp"

int main(int argc, char *argv[])
{
    set_qt_environment();

    QGuiApplication app(argc, argv);

    DataBaseCursor cursor(&app);
    //qmlRegisterType<DataBase::DataBaseCursor>("GLModule.DataBase", 1, 0, "DataBaseCursor");
    QLocale::setDefault(QLocale::c());
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("DataBaseCursor", &cursor);

    const QUrl url(u"qrc:Main/main.qml"_qs);
    QObject::connect(
                &engine, &QQmlApplicationEngine::objectCreated, &app,
                [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    },
    Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.addImportPath(":/imports");

    engine.load(url);

    if (engine.rootObjects().isEmpty()) {
        return EXIT_FAILURE;
    }

    return app.exec();
}
