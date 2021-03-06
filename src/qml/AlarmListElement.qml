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
        text: "" + time_h + ":" + time_m
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
        property bool isHours: false
        property bool isMinutes: false
        id: alarmDetails
        rotation: appWindow.rotation

        acceptButtonText: "Save"
        rejectButtonText: "Cancel"
        buttons: SheetButton {
            id: deleteButton
            text: "Delete"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            onClicked: { console.log ("Delete this") } //TODO
        }

        content: Item {
            anchors.fill: parent

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
            TextField {
                id: textNameDetail
                text: name
                font.bold: true
                font.pixelSize: 48
                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.left: alarmIconDetail.right
                anchors.top:parent.top
                anchors.topMargin: 5
            }

            Text {
                id: textTimeDetail
                text: "" + time_h + ":" + time_m
                font.bold: true
                font.pixelSize: 24
                color: "white"
                style: Text.Outline
                styleColor: "black"
                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.bottom: alarmIconDetail.bottom
                anchors.bottomMargin: 20
            }
            Image {
                id: clockImageDetail
                source: "qrc:/data/clock_body.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: alarmIconDetail.bottom
                anchors.topMargin: 50
                MouseArea {
                    id: rotator
                    property int midX: clockImageDetail.width/2
                    property int midY: clockImageDetail.height/2
                    property int rotationAngle: 0
                    anchors.fill: clockImageDetail
                    onReleased: { alarmDetails.isHours = false; alarmDetails.isMinutes = false }
                    onMousePositionChanged: {
                        if ((alarmDetails.isHours == true) || (alarmDetails.isMinutes == true)) {
                            if (mouse.x > midX) {
                                if (mouse.y > midY) {
                                    rotationAngle = hourRotationDetail.angle = 90 + (180/Math.PI) * Math.atan(Math.abs(midY - mouse.y)/Math.abs(midX - mouse.x))
                                } else {
                                    rotationAngle = (180/Math.PI) * Math.atan(Math.abs(midX - mouse.x)/Math.abs(midY - mouse.y))
                                }
                            } else {
                                if (mouse.y > midY) {
                                    rotationAngle = 180 + (180/Math.PI) * Math.atan(Math.abs(midX - mouse.x)/Math.abs(midY - mouse.y))
                                } else {
                                    rotationAngle = 270 + (180/Math.PI) * Math.atan(Math.abs(midY - mouse.y)/Math.abs(midX - mouse.x))
                                }
                            }
                            if (alarmDetails.isHours) {
                                hourRotationDetail.angle = rotationAngle
                                textTimeDetail.text = Math.round(rotationAngle/30) + ":" + time_m
                                time_h = Math.round(rotationAngle/30)  //FIXME - read only property
                            } else {
                                minuteRotationDetail.angle = rotationAngle
                                textTimeDetail.text = time_h + ":" + Math.round(rotationAngle/6)
                                time_m = Math.round(rotationAngle/6)  //FIXME - read only property
                            }
                        }
                    }
                }
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
                    angle: (time_h * 30) + (time_m * 0.5)
                }
                MouseArea {
                    anchors.fill: hourHandDetail
                    onPressed: { alarmDetails.isHours = true; alarmDetails.isMinutes = false; rotator.clicked(mouse)}
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
                    angle: time_m * 6
                }
                MouseArea {
                    anchors.fill: minuteHandDetail
                    onPressed: { alarmDetails.isMinutes = true; alarmDetails.isHours = false; rotator.clicked(mouse) }

                }
            }
            Image {
                source: "qrc:/data/clock_midbit.png"
                x: clockImageDetail.x + clockImageDetail.width/2 - width/2
                y: clockImageDetail.y + clockImageDetail.height/2 - height/2
            }
            CheckBox {
                id: alarmActiveDetailSwitch
                checked: active
                text: "Alarm active?"
                anchors.top: clockImageDetail.bottom
                anchors.topMargin: 50
                anchors.left: parent.left
                anchors.leftMargin: 20
                onClicked: {
                    alarmIconDetail.source = (checked) ? "qrc:/data/icon-l-alarm-active.svg" : "qrc:/data/icon-l-alarm-inactive.svg"
                    //active = checked //FIXME: this does not work - read only property?
                }
            }
            Button {
                id: repetitionSelectionButton
                text: "Repeat: Daily"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: repetitionSelectionDialog.open()
            }

            SelectionDialog {
                id: repetitionSelectionDialog
                titleText: "Select "
                selectedIndex: 0
                model: ListModel {
                    ListElement { name: "Daily" }
                    ListElement { name: "Every work day" }
                    ListElement { name: "single shot" }
                }
            }
        }
        onAccepted: { console.log("Accepted") }  //TODO
        onRejected: { console.log("Rejected") }  //TODO
    }
}


