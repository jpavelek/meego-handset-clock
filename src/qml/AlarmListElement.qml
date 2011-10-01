import QtQuick 1.0

Item {
    width: parent.width
    height: 80

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
        anchors.topMargin: 5
    }
    Image {
        id: intBellImage
        source: (active) ? "qrc:/data/icon-m-alarm-active.svg" : "qrc:/data/icon-m-alarm-inactive.svg"
        width:  36
        height: 36
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 5
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
        anchors.bottomMargin: 5
    }


}

