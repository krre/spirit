import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import "../../js/utils.js" as Utils

Window {
    title: qsTr("Console")
    minimumWidth: 310
    minimumHeight: 570
    color: sysPalette.window

    Component.onCompleted: {
        Utils.loadGeomerty("Console")
    }

    Component.onDestruction: {
        Utils.saveGeometry("Console")
    }

    Action {
        shortcut: "Esc"
        onTriggered: hide()
    }

    Action {
        shortcut: "Tab"
        onTriggered: hide()
    }

    TabView {
        anchors.fill: parent

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
