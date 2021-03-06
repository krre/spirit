import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import "../components"
import "../../js/utils.js" as Utils

WindowDialog {
    title: qsTr("Console")
    indent: 0
    modality: Qt.NonModal
    hideButtons: true
    settingsGroup: "Console"

    Component.onCompleted: {
        var currentIndex = Settings.value(settingsGroup, "currentTab")
        if (!(typeof currentIndex === "undefined")) {
            tabView.currentIndex = currentIndex
        }
    }

    Component.onDestruction: {
        Settings.setValue(settingsGroup, "currentTab", tabView.currentIndex)
    }

    TabView {
        id: tabView
        anchors.fill: parent
        visible: workArea.visible

        Tab {
            title: qsTr("Personality")
            active: true

            Personality {}
        }

        Tab {
            title: qsTr("Messages")
            active: true

            Messages {}
        }

        Tab {
            title: qsTr("Actions")
            active: true

            Actions {}
        }

        Tab {
            title: qsTr("Environment")
            active: true

            Environment {}
        }
    }
}
