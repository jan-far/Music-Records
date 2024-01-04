import QtQuick
import QtQuick.Controls 6.2
import QtQuick.Layouts
import Music

Rectangle {
    Layout.fillWidth: true
    height: 50
    color: "transparent"
    Layout.rightMargin: 5

    Column {
        height: parent.height
        width: parent.width
        spacing: -5

        Switch {
            id: toggleSwitch
            property color activeColor: "#5c5470"
            property double sizeScale: 1.5

            checked: false
            anchors.horizontalCenter: parent.horizontalCenter
            onCheckedChanged: {
                switchStatus = toggleSwitch.position
                console.log('change::: ', toggleSwitch.position)}

            indicator: Rectangle {
                implicitWidth: 40 * toggleSwitch.sizeScale
                implicitHeight: 20 * toggleSwitch.sizeScale
                radius: 500
                color: toggleSwitch.checked ? toggleSwitch.activeColor : Constants.darkBgGradient
                Behavior on color {
                    ColorAnimation { duration: 150 }
                }
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    x: toggleSwitch.checked ? parent.width - width : 0
                    width: 20 * toggleSwitch.sizeScale
                    height: 20 * toggleSwitch.sizeScale
                    radius: 500
                    anchors.verticalCenter: parent.verticalCenter
                    color: toggleSwitch.down ? "#cccccc" : "#ffffff"
                    border.color: toggleSwitch.checked ? toggleSwitch.activeColor : "#999999"
                    Behavior on x {
                        NumberAnimation {
                            easing.type: Easing.InOutCubic
                        }
                    }
                }
            }
        }

        Label {
            text: "Theme Switch"
            font.bold: true
            font.pixelSize: 9
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Component.onCompleted: switchStatus = toggleSwitch.position
}
