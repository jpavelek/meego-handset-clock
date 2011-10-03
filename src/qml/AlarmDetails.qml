import QtQuick 1.0
import com.nokia.meego 1.0

Sheet {
    id: alarmDetails

    acceptButtonText: "Save"
    rejectButtonText: "Cancel"
    rejectButton.enabled: true
    buttons: SheetButton {
        id: deleteButton
        text: "Delete"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    content: Flickable {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.topMargin: 10
        flickableDirection: Flickable.VerticalFlick

        Image {
            id: alarmIconDetail
            width:  128
            height: 128
            source: (active) ? "qrc:/data/icon-m-alarm-active.svg" : "qrc:/data/icon-m-alarm-inactive.svg"
            anchors.top: parent.top
            anchors.left: parent.left
        }
        Text {
            id: textNameDetail
            text: name
            font.bold: true
            font.pixelSize: 48
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top:parent.top
            anchors.topMargin: 5
        }
        Text {
            id: textTimeDetail
            text: time
            font.bold: true
            font.pixelSize: 24
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: alarmIconDetail.bottom
        }
    }
}

