// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls
import QtQuick.Layouts
import Music
import QtQuick.Dialogs
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

    property int switchStatus: 0
    property bool lightMode: switchStatus < 1

    Material.theme: lightMode ? Material.Light : Material.Dark

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
