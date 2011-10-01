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
        font.pixelSize: 36
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top:parent.top
        anchors.topMargin: 5
    }
    Text {
        id: textRepetition
        text: repetition
        color: "white"
        style: Text.Outline
        styleColor: "black"
        font.pixelSize: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.left: textName.left
    }
    Image {
        id: intBellImage
        source: (active) ? "qrc:/data/icon-m-alarm-active.svg" : "qrc:/data/icon-m-alarm-inactive.svg"
        width:  24
        height: 24
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
        font.pixelSize: 14
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: intBellImage.bottom
        anchors.topMargin: 5
    }


}

