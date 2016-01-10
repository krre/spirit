import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import "main"
import "console"
import "../js/utils.js" as Utils

ApplicationWindow {
    id: mainRoot
    property string name
    property alias sysPalette: sysPalette
    property var consoleWindow
    property var logWindow
    title: Qt.application.name + (workArea.name ? " - " + workArea.name : "") + (Brain.isPaused ? " " + qsTr("(paused)") : "")
    width: 800
    height: 600
    visible: true
    menuBar: MainMenu { id: mainMenu }

    Component.onCompleted: {
        Utils.loadGeomerty("MainWindow")
        Utils.loadRecentFiles()
        Utils.loadSession()
    }

    onClosing: {
        Utils.saveGeometry("MainWindow")
        Utils.saveRecentFiles()
        Utils.saveSession()
    }

    onConsoleWindowChanged: {
        if (!consoleWindow) mainMenu.consoleAI.checked = false
    }

    onLogWindowChanged: {
        if (!logWindow) mainMenu.log.checked = false
    }

    SystemPalette {
        id: sysPalette
        colorGroup: SystemPalette.Active
    }

    WorkArea {
        id: workArea
        anchors.fill: parent
        visible: name
    }
}
