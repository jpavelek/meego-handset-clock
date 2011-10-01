import QtQuick 1.0
import com.nokia.meego 1.0


Page {
    id: intClocksPage
    property int hours: 7
    property int minutes: 20
    property int seconds: 47
    property string city: "Helsinki/Finland"
    property string timezone: "GMT+2"

    Component.onCompleted:updateTime()
    onStatusChanged: updateTime()

    function updateTime() {
        var date = new Date;
        hours = date.getHours();
        minutes = date.getMinutes();
        seconds = date.getSeconds();
    }

    Item {
        id: portraitClocksPage
        Image {
            id: clockImageP
            source: "qrc:/data/clock_body.png"
            //anchors.horizontalCenter: parent.horizontalCenter
            //x: (parent.width - width)/2
            x: (appWindow.height - width)/2 //Now, someone PLS explain me why this works :(
            anchors.top: parent.top
            anchors.topMargin: 30
        }
        Text {
            id: textCity
            text: city
            font.bold: true
            color: "white"
            style: Text.Outline
            styleColor: "black"
            font.pixelSize: 36
            anchors.top: clockImageP.bottom
            anchors.topMargin: 30
            x: clockImageP.x + (clockImageP.width/2) - (width/2)
        }
        Text {
            id: textTimezone
            text: timezone
            font.bold: true
            color: "white"
            style: Text.Outline
            styleColor: "black"
            font.pixelSize: 36
            anchors.top: textCity.bottom
            anchors.topMargin: 30
            x: clockImageP.x + (clockImageP.width/2) - (width/2)
        }
    }

    Item {
        id: landscapeClocksPage
        Image {
            id: clockImageL
            source: "qrc:/data/clock_body.png"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 30
            anchors.topMargin: 5
        }
    }


    states: [
            State {
                name: "inLandscape"
                when: !appWindow.inPortrait
                PropertyChanges {
                    target: landscapeClocksPage
                    visible: true
                }
                PropertyChanges {
                    target: portraitClocksPage
                    visible: false
                }
            },
            State {
                name: "inPortrait"
                when: appWindow.inPortrait
                PropertyChanges {
                    target: landscapeClocksPage
                    visible: false
                }
                PropertyChanges {
                    target: portraitClocksPage
                    visible: true
                }
            }
        ]

    Rectangle {
        id: hourHand
        color: "black"
        width: 30
        height: 100
        x: (clockImageL.visible) ? clockImageL.x + (clockImageL.width/2) - (width/2) : clockImageP.x + (clockImageP.width/2) - (width/2)
        y: (clockImageL.visible) ? clockImageL.y + (clockImageL.height/2) - height : clockImageP.y + (clockImageP.height/2) - height
        smooth: true
        transform: Rotation {
            id: hourRotation
            origin.x: hourHand.width/2
            origin.y: hourHand.height
            angle: (intClocksPage.hours * 30) + (intClocksPage.minutes * 0.5)
        }
    }
    Rectangle {
        id: minuteHand
        color: "black"
        width: 16
        height: 140
        x: (clockImageL.visible) ? clockImageL.x + (clockImageL.width/2) - (width/2) :clockImageP.x + (clockImageP.width/2) - (width/2)
        y: (clockImageL.visible) ? clockImageL.y + (clockImageL.height/2) - height : clockImageP.y + (clockImageP.height/2) - height
        smooth: true
        transform: Rotation {
            id: minuteRotation
            origin.x: minuteHand.width/2
            origin.y: minuteHand.height
            angle: intClocksPage.minutes * 6
        }
    }
    Rectangle {
        id: secondsHand
        color: "red"
        width: 8
        height: 145
        x: (clockImageL.visible) ? clockImageL.x + (clockImageL.width/2) - (width/2) : clockImageP.x + (clockImageP.width/2) - (width/2)
        y: (clockImageL.visible) ? clockImageL.y + (clockImageL.height/2) - height : clockImageP.y + (clockImageP.height/2) - height
        smooth: true
        transform: Rotation {
            id: secondsRotation
            origin.x: secondsHand.width/2
            origin.y: secondsHand.height
            angle: intClocksPage.seconds * 6
        }
    }
    Image {
        source: "qrc:/data/clock_midbit.png"
        x: (clockImageL.visible) ? clockImageL.x + clockImageL.width/2 - width/2 : clockImageP.x + clockImageP.width/2 - width/2
        y: (clockImageL.visible) ? clockImageL.y + clockImageL.height/2 - height/2 : clockImageP.y + clockImageP.height/2 - height/2
    }


    Timer {
        interval: 1000
        running: appWindow.visible
        repeat: true
        onTriggered: {
            if (seconds===59) {
                seconds = 0;
                if (minutes===59) {
                    minutes = 0;
                    if (hours===11) {
                        hours = 0
                    } else {
                        hours++
                    }
                } else {
                    minutes = minutes + 1;
                }
            } else {
                seconds++;
            }
        }
    }
}


