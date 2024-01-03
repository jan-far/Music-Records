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
                            id: emptyHeader
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            visible: parent.count === 0
                            text: qsTr("Nothing to show yet!")
                            font.bold: true
                        }

                        Label {
                            id: emptyBody
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

        Row {
            spacing: 15
            padding: 10

            Rectangle {
                id: imageContainer
                width: 150
                height: 150
                color: 'green'
                radius: 25
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
                        Text {
                            text: "Songs: "
                            font.bold: true
                        }

                        Column {
                            spacing: 2
                            Repeater {
                                model: songs
                                Row {
                                    Text {
                                        text: " - "
                                        font.pixelSize: 14
                                        font.bold: true
                                    }
                                    Text {
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

    component CustomLabel: Row {
        property string label
        property variant value

        spacing: 1

        Text {
            text: label + ": "
            font.bold: true
        }

        Text {
            text: value
        }
    }
}
