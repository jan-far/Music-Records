pragma Singleton
import QtQuick 6.2
//import QtQuick.Studio.Application

QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

    function calcMin(mainValue, firstValue, secondValue) {
        return mainValue > firstValue ? firstValue : mainValue < secondValue ? secondValue : mainValue
    }

    property string relativeFontDirectory: "fonts"

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: Qt.application.font.family,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: Qt.application.font.family,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })

    readonly property color backgroundColor: "#c2c2c2"
    readonly property color primaryColor: "#0f0"
    readonly property Gradient lightBgGradient: Gradient{
        GradientStop {
            position: 0
            color: "#e6e9f0"
        }
        GradientStop{
            position: 1
            color: "#eef1f5"
        }
    }

    readonly property Gradient darkBgGradient: Gradient {
        GradientStop {
            position: 0.11
            color: "#242d39"
        }
        GradientStop {
            position: 0.51
            color: "#10253c"
        }
        GradientStop {
            position: 0.98
            color: "#000000"
        }
    }



//    property StudioApplication application: StudioApplication {
//        fontPath: Qt.resolvedUrl("../../content/" + relativeFontDirectory)
//    }
}
