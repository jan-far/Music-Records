pragma Singleton
import QtQuick 6.2
//import QtQuick.Studio.Application

QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

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


    readonly property Gradient darkContainerHover : Gradient {
        GradientStop {
            position:  0.3
            color: "#192338"
        }
        GradientStop {
            position: 0.7
            color: "#172138"
        }
        GradientStop {
            position: 1
            color: "#1e2433"
        }
    }

    readonly property Gradient darkContainerDefault: Gradient{
        GradientStop {
            position: 0.15
            color: "#232426"
        }
        GradientStop {
            position: 0.3
            color: "#1a202e"
        }

        property Gradient lightContainerHover: Gradient{
            GradientStop {
                position: 0.15
                color: "#cbcfd6"
            }
            GradientStop {
                position:0.4
                color:"#bdc2c7"
            }
            GradientStop {
                position: 1
                color: "#bbbdbf"
            }
        }

        property Gradient lightContainerDefault: Gradient{
            GradientStop {
                position: 0.15
                color: "#dcdfe6"
            }
            GradientStop {
                position: 0.4
                color: "#c9cdd1"
            }
            GradientStop {
                position:1
                color: "#c6c9cf"
            }
        }

    }


    readonly property Gradient lightContainerHover: Gradient{
        GradientStop {
            position: 0.15
            color: "#cbcfd6"
        }
        GradientStop {
            position:0.4
            color:"#bdc2c7"
        }
        GradientStop {
            position: 1
            color: "#bbbdbf"
        }
    }

    readonly property Gradient lightContainerDefault: Gradient{
        GradientStop {
            position: 0.15
            color: "#dcdfe6"
        }
        GradientStop {
            position: 0.4
            color: "#c9cdd1"
        }
        GradientStop {
            position:1
            color: "#c6c9cf"
        }
    }

    //    property StudioApplication application: StudioApplication {
    //        fontPath: Qt.resolvedUrl("../../content/" + relativeFontDirectory)
    //    }
}
