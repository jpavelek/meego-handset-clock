import QtQuick 1.0
import com.nokia.meego 1.0
import com.nokia.extras 1.1

Page {
    id: intAlarmsPage

    ListModel {
        id: demoModel
        ListElement {
            name: "Airport"
            repetition: "single alarm"
            time: "5:45"
            active: true
        }
        ListElement {
            name: "Wake-up"
            repetition: "Every work day"
            time: "7:15"
            active: true
        }
        ListElement {
            name: "Kindergarten"
            repetition: "Every work day"
            time: "17:13"
            active: false
        }
    }

    ListView {
        id: demoListView
        anchors.fill: parent
        model: demoModel
        delegate:  AlarmListElement {}
    }

    ScrollDecorator {
        flickableItem: demoListView
    }
}
