import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import "../../js/utils.js" as Utils

Window {
    title: qsTr("Console")
    width: 300
    height: 400
    color: "#ced1ff"

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
}
