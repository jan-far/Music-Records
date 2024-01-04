
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import Music
import QtQuick.Timeline 1.0
import QtCore

Rectangle {
    id: rootContainer
    width: Constants.width * 0.4
    height: Constants.height * 0.6
    gradient: lightMode ? Constants.lightBgGradient : Constants.darkBgGradient

    SplitView {
        id: splitView
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle {
            id: leftContainer
            implicitWidth: parent.width * 0.25
            SplitView.maximumWidth: parent.width * 0.3
            SplitView.minimumWidth: parent.width * 0.2
            color: "transparent"

            LeftContainerItem {
                id: leftContainerItem
            }
        }

        Rectangle {
            id: rightContainer
            SplitView.fillWidth: true
            implicitHeight: parent.height
            color: "transparent"

            RightContainerItem {
                id: rightContainerItem
            }
        }
    }

    Column {
        width: 60
        height: 60
        spacing: 5
        y: parent.height - 80
        x: parent.width - 65

        Rectangle {
            id: addButtonContainer
            width: 45
            height: 45
            color: "green"
            radius: 50
            gradient: lightMode ? Gradient.SoftGrass : Gradient.NightSky
            anchors.horizontalCenter: parent.horizontalCenter

            RoundButton {
                id: addButton
                text: "+"
                hoverEnabled: false
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: formModal.open()
                }
            }
        }

        Label {
            text: qsTr("Add CD")
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
