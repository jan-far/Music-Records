import QtQuick
import QtQuick.Controls


Popup {
    id: popup
    width: parent.width * 0.6
    height: parent.height * 0.8
    modal: true
    focus: true
    dim: true
    background: Rectangle {
        color: "transparent"
    }
    //        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    anchors.centerIn: parent
    enter: Transition {
        NumberAnimation { property: "scale"; from: 0.0; to: 1.0 }
    }
    exit: Transition {
        NumberAnimation { property: "scale"; from: 1.0; to: 0.0 }
    }

    signal saveRecord

    property AddAlbumForm albumForm: addAlbumForm

    contentItem:
        AddAlbumForm {
        id: addAlbumForm
        onSubmitForm: saveRecord()
    }
}

