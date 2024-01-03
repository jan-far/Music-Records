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
        ListElement {
            cdTitle: "a"
            artistName: "Bohn smith"
            year: 2022
            genre: "pop"
            songs: [
                ListElement {
                    song: "I am here"
                },
                ListElement {
                    song: "Wasn't easy"
                }
            ]
        }
        ListElement {
            cdTitle: "b"
            artistName: "Aion smith"
            year: 2023
            genre: "pop"
            songs: [
                ListElement {
                    song: "We are getting there"
                },
                ListElement {
                    song: "Never giving up"
                }
            ]
        }
    }

    Component.onCompleted:  {
//        Scripts.populateListModel(fileio, musicRecordModel)
    }
}
