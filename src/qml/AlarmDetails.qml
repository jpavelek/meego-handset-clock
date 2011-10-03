import QtQuick 1.0
import com.nokia.meego 1.0

Sheet {
    id: alarmDetails

    acceptButtonText: "Save"
    rejectButtonText: "Cancel"
    rejectButton.enabled: true

    content: Flickable {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.topMargin: 10
        flickableDirection: Flickable.VerticalFlick

        Image {
            id: alarmIcon
            source: (active) ? "qrc:/data/icon-m-alarm-active.svg" : "qrc:/data/icon-m-alarm-inactive.svg"
            anchors.top: parent.top
            anchors.left: parent.left
        }

    }

}

