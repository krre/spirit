import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import "../components"
import "../../js/utils.js" as Utils

WindowDialog {
    title: qsTr("Console")
    minimumWidth: 310
    minimumHeight: 570
    indent: 0
    modality: Qt.NonModal
    hideButtons: true
    settingsGroup: "Console"

    TabView {
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
