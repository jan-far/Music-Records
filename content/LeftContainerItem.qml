import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import Music
import "./Scripts.js" as Scripts

Item {
    width: parent.width
    height: parent.height

    ColumnLayout {
        id: leftColumn
        anchors.fill: parent

        Rectangle {
            id: searchFieldWrapper
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 60
            color: "transparent"

            TextField {
                id: searchField
                width: parent.width * 0.9
                height: 38
                selectionColor: "#010113"
                placeholderText: qsTr("Search")
                cursorVisible: true
                font.pointSize: 14
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                onTextChanged: () => {
                                   rightContainerItem.searchValue = searchField.text.toLowerCase()
                               }
            }
        }

        Rectangle {
            color: lightMode ? "#bdc2c7" : "#1a202e"
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 2
        }

        Rectangle {
            id: leftContent
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.topMargin: 5
            color: "transparent"

            property Gradient gradientStatus: Scripts.getThemeGradient(ma_allAlbum)
            property var initials: Scripts.getInitials(musicRecords)

            Column {
                width: parent.width * 0.9
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 16

                Button {
                    id: allAlbumBtn
                    text: qsTr("All Albums")
                    font.weight: 600
                    font.pixelSize: 12
                    width: parent.width
                    flat: true
                    background: Rectangle {
                        gradient:  leftContent.gradientStatus
                        opacity: ma_allAlbum.containsMouse ? 1: 0.9
                        border.color: "transparent"
                    }
                    contentItem: Label {
                        text: allAlbumBtn.text
                        font: allAlbumBtn.font
                    }

                    MouseArea {
                        id: ma_allAlbum
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            searchField.text = ""
                            searchField.focus = false
                            rightContainerItem.filterTitleBy = ""
                            rightContainerItem.titleFiltered = false
                        }
                    }
                }

                Column {
                    spacing: 4
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Label {
                        text: qsTr(" -- Alphabets")
                        font.pixelSize: 10
                        font.bold: true
                    }

                    Rectangle {
                        color:'transparent'
                        width: parent.width
                        height: 200

                        Flow {
                            spacing: 10
                            anchors.fill: parent

                            Repeater {
                                model: leftContent.initials
                                Label {
                                    id: label
                                    text: modelData.letter
                                    font.weight: 700
                                    topPadding: 8
                                    leftPadding: 8
                                    rightPadding: 8
                                    width: 26
                                    opacity: modelData.exists ? 1 : 0.6
                                    enabled: modelData.exists

                                    background: CustomBorder {
                                        id: cb
                                        commonBorder: false
                                        bBorderwidth: 2
                                        borderColor: lightMode ? "#000" : "#eee"
                                        height: rightContainerItem.titleFiltered && rightContainerItem.filterTitleBy === modelData.letter ? 2 : 0
                                    }

                                    MouseArea {
                                        id: ma_initial
                                        hoverEnabled: modelData.exists
                                        anchors.fill: parent
                                        cursorShape: modelData.exists ? Qt.PointingHandCursor : Qt.ArrowCursor
                                        onEnabledChanged: {
                                            console.log('changed')
                                        }

                                        onClicked: {
                                            rightContainerItem.filterTitleBy = modelData.letter
                                            rightContainerItem.titleFiltered = true
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
}
