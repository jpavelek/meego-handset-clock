import QtQuick 1.0

Item {
    width: 400
    height: 64

    Row {
        Image {
            source: "qrc:/data/icon-m-alarms.svg"
            width:  64
            height: 64

        }
        Column {
            width: 400
            Text {
                id: textName
                text: name
                font.bold: true
                color: "white"
                style: Text.Outline
                styleColor: "black"
                font.pixelSize: 24
                //anchors.leftMargin: 30
            }
            Text {
                id: textRepetition
                text: repetition
                font.bold: true
                color: "white"
                style: Text.Outline
                styleColor: "black"
                font.pixelSize: 12
                //anchors.bottom: parent.bottom
                //anchors.leftMargin: 30
            }
        }
        Text {
            id: textTime
            text: time
            font.bold: true
            color: "white"
            style: Text.Outline
            styleColor: "black"
            font.pixelSize: 24
            //anchors.right: parent.right
        }
    }
}
