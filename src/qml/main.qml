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
    title: Qt.application.name + (workArea.name ? " - " + workArea.name : "")
    width: 800
    height: 600
    visible: true
    menuBar: MainMenu { id: mainMenu }

    Component.onCompleted: {
        Utils.loadGeomerty("MainWindow")
        Utils.loadRecentFiles()

        if (Settings.value("Interface", "restoreLastSession")) {
            var workFilePath = Settings.value("Path", "lastWorkFile")
            if (workFilePath) {
                Utils.openAI(workFilePath)
            }
        }
    }

    onClosing: {
        Utils.saveGeometry("MainWindow")
        Utils.saveRecentFiles()

        if (Settings.value("Interface", "restoreLastSession")) {
            Settings.setValue("Path", "lastWorkFile", workArea.workFilePath)
        }
    }

    WorkArea {
        id: workArea
        anchors.fill: parent
        visible: name
    }

    Console {
        id: consoleAI
        visible: mainMenu.consoleAI.checked
        onVisibleChanged: {
            if (!visible) {
                mainMenu.consoleAI.checked = false
            }
        }
    }
}
