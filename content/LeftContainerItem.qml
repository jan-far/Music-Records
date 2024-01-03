import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import Music

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
            id: leftContent
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
        }
    }
}
