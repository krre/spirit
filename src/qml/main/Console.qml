import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2

Window {
    title: qsTr("Console")
    width: 300
    height: 400

    Action {
        shortcut: "Esc"
        onTriggered: hide()
    }

    Action {
        shortcut: "Tab"
        onTriggered: hide()
    }
}
