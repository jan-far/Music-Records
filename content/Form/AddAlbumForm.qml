import QtQuick 2.15
import QtQuick.Controls 2.15
import "../Scripts.js" as Scripts
import Music

Rectangle {
    id: formFields
    gradient: switchStatus < 1 ? Gradient.HeavyRain : Gradient.ViciousStance
    anchors.fill: parent
    radius: 20

    property string title: titleField.text.trim()
    property string artist: artistField.text.trim()
    property string year: yearField.text.trim()
    property string genre: genreField.text.trim()

    Rectangle {
        anchors.fill: parent
        anchors.leftMargin: 25
        anchors.rightMargin: 25
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        radius: 10
        border.width: 1
        border.color: "grey"
        anchors.centerIn: parent
        gradient: switchStatus < 1 ? Constants.lightBgGradient : Constants.darkBgGradient

        Column {
            id: wrapper
            anchors.fill: parent
            spacing: 5

            Item {
                id: header
                width: parent.width - 3
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: -15

                Label{
                    id: formTitle
                    text: qsTr("Add CD information")
                    font.bold: true
                    font.weight: 25
                    font.underline: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    topInset: 5
                    topPadding: 15
                    bottomPadding: 5
                }
            }

            Rectangle {
                id: formerWrapper
                height: parent.height - 40
                width: parent.width - 3
                anchors.margins: 5
                anchors.horizontalCenter: parent.horizontalCenter
                gradient: switchStatus < 1 ? Constants.lightBgGradient : Constants.darkBgGradient

                Column {
                    id: formLayout
                    anchors.fill: parent
                    spacing: 5
                    anchors.horizontalCenter: parent.horizontalCenter

                    Row {
                        id: titleRow
                        width: parent.width * 0.7
                        height: 60
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 16

                        Label {
                            text: qsTr("Title: ")
                            verticalAlignment: Text.AlignVCenter
                            font.bold: true
                            height: parent.height
                        }

                        CustomTextField {
                            id: titleField
                            width: 200
                            height: 40
                            anchors.verticalCenter: parent.verticalCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Row {
                        id: artistRow
                        width: parent.width * 0.7
                        height: 60
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 8

                        Label {
                            text: qsTr("Artist: ")
                            verticalAlignment: Text.AlignVCenter
                            font.bold: true
                            height: parent.height
                        }

                        CustomTextField {
                            id: artistField
                            width: 200
                            height: 40
                            anchors.verticalCenter: parent.verticalCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Row {
                        id: yearRow
                        width: parent.width * 0.7
                        height: 60
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 16

                        Label {
                            text: qsTr("Year: ")
                            verticalAlignment: Text.AlignVCenter
                            font.bold: true
                            height: parent.height
                        }

                        CustomTextField {
                            id: yearField
                            width: 200
                            height: 40
                            anchors.verticalCenter: parent.verticalCenter
                            verticalAlignment: Text.AlignVCenter
                            inputType: yearField.numberType
                        }
                    }

                    Row {
                        id: genreRow
                        width: parent.width * 0.7
                        height: 60
                        spacing: 8
                        anchors.horizontalCenter: parent.horizontalCenter

                        Label {
                            text: qsTr("Genre: ")
                            verticalAlignment: Text.AlignVCenter
                            font.bold: true
                            height: parent.height
                        }

                        CustomTextField {
                            id: genreField
                            width: 200
                            height: 40
                            anchors.verticalCenter: parent.verticalCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Rectangle {
                        id: submit
                        width: parent.width
                        height: 50
                        color: "transparent"

                        Button{
                            id: submitButton
                            text: qsTr("Add Record")
                            anchors.horizontalCenter: parent.horizontalCenter

                            Connections {
                                target: submitButton
                                onClicked: {
                                    if (!title || !artist || !year || !genre) {
                                        !title ? titleField.isInvalid = true : null;
                                        !artist ? artistField.isInvalid = true : null;
                                        !year && year.length < 4 ? yearField.isInvalid = true : null;
                                        !genre ? genreField.isInvalid = true : null
                                    } else {
                                        Scripts.saveDocument(fileio, formFields, musicRecords, toast)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
