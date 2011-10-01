import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow
    initialPage: topPage

    PageStackWindowStyle {
        id: clocksStyle
        background: "clocks-bg-landscape.jpg"
        backgroundFillMode: Image.PreserveAspectCrop
    }
    platformStyle: clocksStyle

    Page {
        id: topPage
        tools: commonTools

        ToolBarLayout {
            id: commonTools
            visible: true

            ToolIcon {
                id: backButton
                visible: false // turn visible and active when drilling down
                iconId: "toolbar-back"
                onClicked: pageStack.pop()
            }
            ButtonRow {
                platformStyle: TabButtonStyle {}
                TabButton {
                    id: tabButtonClocks
                    tab: tabClocks
                    iconSource: "icon-m-clocks.svg"
                }
                TabButton {
                    id: tabButtonAlarms
                    tab: tabAlarms
                    iconSource: "icon-m-alarms.svg"
                }
            }
            ToolIcon {
                id: menuButton
                iconId: "toolbar-view-menu"
                onClicked: (clocksMenu.status == DialogStatus.Closed) ? clocksMenu.open() : clocksMenu.close()
            }

        }

        TabGroup {
            id: tabGroup
            currentTab: tabClocks

            PageStack {
                id: tabClocks
                ClocksPage { id: clocksPage }
                currentPage: clocksPage
            }
            PageStack {
                id: tabAlarms
                AlarmsPage { id: alarmsPage }
                currentPage: alarmsPage
            }
        }

        Menu {
            id: clocksMenu
            MenuLayout {
                MenuItem { text: "Settings"}
                MenuItem { text: "Quit"; onClicked: Qt.quit() }
            }
        }
    }
}

