// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls
import QtQuick.Layouts
import Music
import QtQuick.Dialogs
import Fileio
import "Scripts.js" as Scripts

Window {
    id: root
    width: mainScreen.width
    height: mainScreen.height
    visible: true
    title: "Music"

    property ListModel musicRecordModel: musicRecords

    Fileio {
        id: fileio
    }

    ToastManager {
        id: toast
    }

    FormModal {
        id: formModal
        onSaveRecord: Scripts.saveDocument(fileio, formModal, musicRecordModel, toast)
    }

    HomeScreen {
        id: mainScreen
        onOpenModal:  formModal.open()
        albumModel: musicRecordModel
    }

    ListModel {
        id: musicRecords
        ListElement {
            cdTitle: "Lets rock"
            authorName: "John smith"
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
            cdTitle: "Lets rock"
            authorName: "John smith"
            year: 2022
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
