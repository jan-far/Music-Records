import QtQuick 2.15
import QtQuick.Controls 6.2
import QtQuick.Layouts

Rectangle {
    implicitWidth: parent.width * 0.82
    height: 50
    Layout.leftMargin: 10
    color: 'transparent'

    RowLayout {
        id: filterWrapper
        width: parent.width
        height: parent.height

        Rectangle {
            id: sortBy
            height: filterWrapper.height
            width: filterWrapper.width * 0.5
            color: 'transparent'

            Row {
                spacing: 5

                Label {
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
                    id: sortSelect
                    width: 160
                    height: 50
                    anchors.verticalCenter: parent.verticalCenter
                    textRole: "text"
                    valueRole: "value"
                    model: ListModel {
                        id: sortByOptions
                        ListElement {
                            text: "..."
                            value: "cdTitle"
                        }
                        ListElement {
                            text: qsTr("Artist Name")
                            value: "artistName"
                        }
                        ListElement {
                            text: qsTr("Music Style")
                            value: "genre"
                        }
                        ListElement {
                            text: qsTr("Production Year")
                            value: "year"
                        }
                    }
                    onCurrentIndexChanged: currentSortBy = sortByOptions.get(currentIndex).value
                }
            }
        }

        Rectangle {
            id: orderBy
            height: filterWrapper.height
            width: filterWrapper.width * 0.5
            color: 'transparent'

            Row {
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter

                Label {
                    id: orderByText
                    text: qsTr("Order by: ")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 16
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 5
                }

                ComboBox {
                    id: orderSelect
                    width: 90
                    height: 50
                    anchors.verticalCenter: parent.verticalCenter
                    model: ListModel {
                        id: orderByOptions
                        ListElement {text: qsTr("asc")}
                        ListElement {text: qsTr("desc")}
                    }
                    onCurrentIndexChanged: currentOrderBy = orderByOptions.get(orderSelect.currentIndex).text
                }
            }
        }
    }
}
