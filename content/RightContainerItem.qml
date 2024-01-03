import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import Music
import "./SortFilterModel"

Item {
    id: containerRoot
    width: parent.width
    height: parent.height

    property ListModel musicRecordsModel

    property string currentOrderBy : orderByOptions.get(orderSelect.currentIndex).text
    property string currentSortBy : sortByOptions.get(sortSelect.currentIndex).value
    property string searchValue: ""

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        ColumnLayout {
            id: rightColumn
            anchors.fill: parent
            
//            Rectangle {
//                id: searchFieldWrapper
//                Layout.preferredWidth: parent.width
//                Layout.preferredHeight: 60
//                color: "transparent"
    
//                TextField {
//                    id: searchField
//                    width: parent.width * 0.9
//                    height: 38
//                    selectionColor: "#010113"
//                    placeholderText: qsTr("Search")
//                    cursorVisible: true
//                    font.pointSize: 14
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.verticalCenter: parent.verticalCenter
//                    onTextChanged: () => {
//                                       rightContainerItem.searchValue = searchField.text.toLowerCase()
//                                   }
//                }
//            }

            RowLayout {
                id: topBar
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: 60
                spacing: 8

                SortFilter {
                    id: leftTopBar
                }

                ThemeSwitch {
                    id: rightTopBar
                }

            }

            ScrollView {
                id: scrollView
                Layout.fillHeight: true
                Layout.fillWidth: true

                ColumnLayout {
                    id: scrollViewLayout
                    anchors.fill: parent

                    ListView {
                        id: musicRecordListView
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true


                        Label {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            visible: parent.count === 0
                            text: qsTr("Nothing to show yet!")
                            font.bold: true
                        }

                        Label {
                            visible: parent.count === 0
                            text: qsTr("Click on the Add button to add a record!")
                            anchors.top: emptyHeader.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 12
                            font.weight: 600
                        }

                        model: SortFilterDelegateModel {
                            id: sortFilterDelegateModel
                            model: musicRecords
                            filter: searchValue ? model => (model.cdTitle + "," + model.artistName + "," + model.genre).toLowerCase().indexOf(searchValue) !== -1 : null
                            sortRole: currentSortBy
                            sortOrder: currentOrderBy === "asc" ? Qt.AscendingOrder : Qt.DescendingOrder
                            delegate: musicAlbumDelegate
                        }
                    }
                }
            }
        }
    }

    Component {
        id: musicAlbumDelegate

        Pane {
            property Gradient gradientStatus:
                lightMode ?
                    ma.containsMouse ?
                        Constants.lightContainerHover:
                        Constants.lightContainerDefault
                    :ma.containsMouse ?
                        Constants.darkContainerHover :
                        Constants.darkContainerDefault

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            bottomInset: 10
            topInset: 5
            height: 200
            background: Rectangle {
                gradient: gradientStatus
                radius: 10
            }

            MouseArea {
                id: ma
                anchors.fill: parent
                hoverEnabled: true
            }


            Row {
                spacing: 15
                padding: 10

                Image {
                    id: albumImage
                    source: lightMode ? "qrc:/Main/asset_imports/music_light.png" : "qrc:/Main/asset_imports/music_dark.png"
                    width: 150
                    height: 150
                    fillMode: Image.PreserveAspectFit
                }

                Column {
                    topPadding: 5
                    spacing: 5

                    CustomLabel  {
                        label: "CD Title"
                        value: cdTitle
                    }

                    CustomLabel {
                        label: "Name of Artist"
                        value: artistName
                    }

                    CustomLabel {
                        label: "Music style"
                        value: genre
                    }

                    CustomLabel {
                        label: "Production Year"
                        value: year
                    }

                    Column {
                        height: 100
                        width: musicAlbumDelegate.width

                        Row {
                            Label {
                                text: "Songs: "
                                font.bold: true
                            }

                            Column {
                                spacing: 2
                                Repeater {
                                    model: songs
                                    Row {
                                        Label {
                                            text: " - "
                                            font.pixelSize: 14
                                            font.bold: true
                                        }
                                        Label {
                                            text: song
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

    component CustomLabel: Row {
        property string label
        property variant value

        spacing: 1

        Label {
            text: label + ": "
            font.bold: true
        }

        Label {
            text: value
        }
    }
}
