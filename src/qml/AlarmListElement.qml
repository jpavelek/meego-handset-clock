import QtQuick 1.0

Item {
    width: parent.width
    height: 64

    Text {
        id: textName
        text: name
        font.bold: true
        color: "white"
        style: Text.Outline
        styleColor: "black"
        font.pixelSize: 24
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top:parent.top
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
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
    }
    Image {
        id: intBellImage
        source: "qrc:/data/icon-m-alarm-active.svg"
        width:  64
        height: 64
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 5
    }

}

