import QtQuick 1.0

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
            var newcomp;
            var alarmDetails;
            newcomp = Qt.createComponent("AlarmDetails.qml")
            if (newcomp.status == Component.Ready) {
                alarmDetails = newcomp.createObject(appWindow);
                if (alarmDetails === null) {
                    console.log("Error creating AlarmDetails")
                } else {
                    alarmDetails.open()
                }
            } else {
                console.log("Error loading bubble component:", newcomp.errorString())
            }
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


}

