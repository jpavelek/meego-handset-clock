import QtQuick 1.0
import com.nokia.meego 1.0

Item {
    width: parent.width
    height: 96

    Rectangle {
        id: intElementRect
        color: "gray"
        opacity: 0
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onPressed: intElementRect.opacity = 0.3
        onReleased: intElementRect.opacity = 0
        onCanceled: intElementRect.opacity = 0
        onClicked: {
            alarmDetails.open()
        }
    }

    Text {
        id: textName
        text: name
        font.bold: true
        color: "white"
        style: Text.Outline
        styleColor: "black"
        font.pixelSize: 48
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top:parent.top
        anchors.topMargin: 20
    }
    Image {
        id: intBellImage
        source: (active) ? "qrc:/data/icon-m-alarm-active.svg" : "qrc:/data/icon-m-alarm-inactive.svg"
        width:  36
        height: 36
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
    }
    Text {
        id: textTime
        text: time
        font.bold: true
        color: "white"
        style: Text.Outline
        styleColor: "black"
        font.pixelSize: 24
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }

    //
    // Sheet here inline as having it in separate file just does not work with screen rotation :(
    //
    Sheet {
        id: alarmDetails
        rotation: appWindow.rotation

        acceptButtonText: "Save"
        rejectButtonText: "Cancel"
        buttons: SheetButton {
            id: deleteButton
            text: "Delete"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        content: Item {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.topMargin: 10

            Rectangle {
                id: backRectDetail
                color: "black"
                width: parent.width
                height: 128
                anchors.top: parent.top
                anchors.left: parent.left
            }

            Image {
                id: alarmIconDetail
                width:  128
                height: 128
                source: (active) ? "qrc:/data/icon-l-alarm-active.svg" : "qrc:/data/icon-l-alarm-inactive.svg"
                anchors.top: parent.top
                anchors.left: parent.left
            }
            Text {
                id: textNameDetail
                text: name
                font.bold: true
                font.pixelSize: 48
                color: "white"
                style: Text.Outline
                styleColor: "black"
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
                color: "white"
                style: Text.Outline
                styleColor: "black"
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: alarmIconDetail.bottom
                anchors.bottomMargin: 20
            }
            Image {
                id: clockImageDetail
                source: "qrc:/data/clock_body.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: alarmIconDetail.bottom
                anchors.topMargin: 50
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
            CheckBox {
                id: alarmActiveDetailSwitch
                checked: active
                text: "Alarm active?"
                anchors.top: clockImageDetail.bottom
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                onClicked: {
                    alarmIconDetail.source = (checked) ? "qrc:/data/icon-l-alarm-active.svg" : "qrc:/data/icon-l-alarm-inactive.svg"
                    active = checked
                }
            }
        }
    }
}


