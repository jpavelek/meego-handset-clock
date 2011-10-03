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
        Image {
            id: clockImageDetail
            source: "qrc:/data/clock_body.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: alarmIconDetail.bottom
            anchors.topMargin: 10
        }
        Rectangle {
            id: hourHandDetail
            color: "black"
            width: 30
            height: 100
            x: clockImageDetail.x + (clockImageDetail.width/2) - (width/2)
            y: clockImageDetail.y + (clockImageDetail.height/2) - height
            smooth: true
            transform: Rotation {
                id: hourRotationDetail
                origin.x: hourHandDetail.width/2
                origin.y: hourHandDetail.height
                angle: 180 //(intClocksPage.hours * 30) + (intClocksPage.minutes * 0.5)
            }
        }
        Rectangle {
            id: minuteHandDetail
            color: "black"
            width: 16
            height: 140
            x: clockImageDetail.x + (clockImageDetail.width/2) - (width/2)
            y: clockImageDetail.y + (clockImageDetail.height/2) - height
            smooth: true
            transform: Rotation {
                id: minuteRotationDetail
                origin.x: minuteHandDetail.width/2
                origin.y: minuteHandDetail.height
                angle: 0 //intClocksPage.minutes * 6
            }
        }
        Switch {
            id: alarmActiveDetailSwitch
            checked: active
            anchors.top: clockImageDetail.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            onStateChanged: {active = checked }
        }
        Text {
            text: "Alarm active?"
            anchors.left: alarmActiveDetailSwitch.right
            anchors.leftMargin: 10
            //anchors.horizontalCenter: alarmActiveDetailSwitch.horizontalCenter
            anchors.bottom: alarmActiveDetailSwitch.bottom
            font.bold: true
            font.pixelSize: 24
        }
    }
}

