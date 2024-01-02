import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import Music

Item {
    width: parent.width
    height: parent.height

    property ListModel musicRecordsModel

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

                Rectangle {
                    id: leftTopBar
                    Layout.fillWidth: true
                    Layout.maximumWidth: parent.width * 0.7
                    height: 50
                    Layout.leftMargin: 10
                    color: 'transparent'

                    Row {
                        id: sortBy
                        height: parent.height
                        width: parent.width

                        Text {
                            id: sortByText
                            text: qsTr("Sort by: ")
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.bold: true
                            font.pointSize: 16
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 5
                        }

                        ComboBox {
                            width: Constants.calcMin(parent.width * 0.5, 200, 150)
                            height: 50
                            anchors.verticalCenter: parent.verticalCenter
                            model: ListModel {
                                id: sortByOptions
                                ListElement {text: "..."}
                                ListElement {text: qsTr("Artist Name")}
                                ListElement {text: qsTr("Music Style")}
                                ListElement {text: qsTr("Production Year")}
                            }
                            onCurrentIndexChanged: console.log(sortByOptions.get(currentIndex).text)
                        }
                    }
                }

                Rectangle {
                    id: rightTopBar
                    Layout.fillWidth: true
                    Layout.maximumWidth: Constants.calcMin(parent.width * 0.2, 100, 80)
                    height: 50
                    color: "#e0dada"
                    radius: 25
                    border.color: "#b7c5b3"
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

                        model: musicRecordsModel
                        delegate: musicAlbumDelegate
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
                    value: authorName
                }

                CustomLabel {
                    label: "Music style"
                    value: genre
                }

                CustomLabel {
                    label: "Production Year"
                    value: year
                }

                ScrollView {
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
