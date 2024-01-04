import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import Music
import "./SortFilterModel"
import  './Scripts.js' as Scripts

Item {
    id: containerRoot
    width: parent.width
    height: parent.height

    property ListModel musicRecordsModel

    property string currentOrderBy : orderByOptions.get(orderSelect.currentIndex).text
    property string currentSortBy : sortByOptions.get(sortSelect.currentIndex).value
    property string searchValue: ""
    property string filterTitleBy: ""
    property bool titleFiltered: false

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

            Rectangle {
                color: lightMode ? "#bdc2c7" : "#1a202e"
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: 2
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
                            visible: !rightContainerItem.titleFiltered && !rightContainerItem.searchValue && parent.count === 0
                            text: qsTr("Nothing to show yet!")
                            font.bold: true
                        }

                        Label {
                            visible: !rightContainerItem.titleFiltered && !rightContainerItem.searchValue && parent.count === 0
                            text: qsTr("Click on the Add button to add a record!")
                            anchors.top: emptyHeader.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 12
                            font.weight: 600
                        }

                        Label {
                            visible: (rightContainerItem.titleFiltered  && parent.count === 0) || (rightContainerItem.searchValue && parent.count === 0)
                            text: qsTr("No record found!")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                        }

                        model: SortFilterDelegateModel {
                            id: sortFilterDelegateModel
                            model: musicRecords
                            filter: filterTitleBy  ?
                                        model => model && model.cdTitle[0].toUpperCase().indexOf(filterTitleBy) !== -1 :
                                        searchValue ? model => (model.cdTitle + "," + model.artistName + "," + model.genre).toLowerCase().indexOf(searchValue) !== -1 : null
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
            property Gradient gradientStatus: Scripts.getThemeGradient(ma)

            width: parent?.width || 0
            leftPadding: 20
            rightPadding: 20
            leftInset: 15
            rightInset: 15
            bottomInset: 20
            topInset: 5
            height: 210
            background: Rectangle {
                gradient: gradientStatus
                radius: 10
            }

            MouseArea {
                id: ma
                anchors.fill: parent
                hoverEnabled: true
            }

            RowLayout {
                id: dataRow
                spacing: 5
                anchors.fill: parent

                Rectangle {
                    width: 180
                    height: parent.height
                    color:'transparent'

                    Image {
                        id: albumImage
                        source: lightMode ? "qrc:/Main/asset_imports/music_light.png" : "qrc:/Main/asset_imports/music_dark.png"
                        width: 150
                        height: 150
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    id: leftSideContainer
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: 'transparent'

                    ColumnLayout {
                        id: recordsInfo
                        spacing: 5
                        anchors.fill: parent

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

                        Rectangle {
                            color: 'transparent'
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            RowLayout {
                                id: songRow
                                anchors.fill: parent

                                Flow {
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    spacing: 5

                                    Label {
                                        text: "Songs: "
                                        font.bold: true
                                    }

                                    Repeater {
                                        model: songs
                                        Row {
                                            spacing: 3
                                            Label {
                                                text: "➡︎"
                                                font.pixelSize: 8
                                                font.bold: true
                                                anchors.verticalCenter: parent.verticalCenter
                                            }
                                            Label {
                                                text: song +"¸"
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

    Rectangle {
        color: lightMode ? "#bdc2c7" : "#1a202e"
        width: parent.width
        height: 2
        anchors.top: parent.bottom
        anchors.topMargin: 4
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
