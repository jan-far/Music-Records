import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Music

TextField {
    id:control

    readonly property int textType: 0
    readonly property int numberType: 1

    property int inputType: textType
    property bool isInvalid: false
    property bool isBold: false
    property real radius: 12
    property color borderColor: activeFocus ? switchStatus < 1 ? "#2a2d36": "#1d5ffe": isInvalid ? "#f00" : "#464a53"

    font.bold: isBold ? Font.Bold : Font.Normal
    font.weight: isBold ?Font.Bold : Font.Normal

    validator: RegularExpressionValidator {
        regularExpression: inputType === 1 ? /[0-9]{4}/gm : /[a-zA-Z0-9\w\W\s]+/gm
    }

    onTextChanged: () => {
                  isInvalid = false
                  }

    background:Rectangle{
        implicitHeight: control.height
        implicitWidth: control.width
        radius: control.radius
        gradient: switchStatus < 1 ? Constants.lightBgGradient : Constants.darkBgGradient
        border.width:  control.activeFocus ? 2 : 1
        border.color: isInvalid ? "#f00" : control.borderColor
    }
}
