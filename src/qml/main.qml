import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import "main"
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
        var geometry = Settings.map("MainWindow")
        if (Object.keys(geometry).length) {
            x = geometry.x
            y = geometry.y
            width = geometry.width
            height = geometry.height
        } else {
            if (Screen.width && Screen.height) {
                x = (Screen.width - width) / 2
                y = (Screen.height - height) / 2
            } else {
                x = 200
                y = 200
            }
        }

        Utils.loadRecentFiles()

        if (Settings.value("Interface", "restoreLastSession")) {
            var workFilePath = Settings.value("Path", "lastWorkFile")
            if (workFilePath) {
                Utils.openAI(workFilePath)
            }
        }
    }

    onClosing: {
        var geometry = {}
        geometry.x = x
        geometry.y = y
        geometry.width = width
        geometry.height = height
        Settings.setMap("MainWindow", geometry)

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
