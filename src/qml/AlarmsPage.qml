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
            time_h: 5
            time_m: 25
            active: true
        }
        ListElement {
            name: "Wake-up"
            repetition: "Every work day"
            time_h: 7
            time_m: 15
            active: true
        }
        ListElement {
            name: "Kindergarten"
            repetition: "Every work day"
            time_h: 17
            time_m: 13
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
