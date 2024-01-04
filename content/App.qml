// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import QtCore
import Music
import Fileio
import "Scripts.js" as Scripts
import './Form'
import "./Toast"

Window {
    id: root
    width: mainScreen.width
    height: mainScreen.height
    maximumWidth: mainScreen.width
    maximumHeight: mainScreen.height
    minimumWidth: mainScreen.width
    minimumHeight: mainScreen.height
    visible: true
    title: "Music"

    property int switchStatus: settings.theme ?? Material.theme
    property bool lightMode: switchStatus < 1

    Material.theme: root.switchStatus

    Settings {
        id: settings
        category: "Theme"
        property alias theme: root.switchStatus
    }

    Fileio {
        id: fileio
    }

    ToastManager {
        id: toast
    }

    FormModal {
        id: formModal
    }

    HomeScreen {
        id: mainScreen
    }

    ListModel {
        id: musicRecords
    }

    Component.onCompleted:  {
        Scripts.populateListModel(fileio, musicRecords)
    }
}
