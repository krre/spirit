import QtQuick 2.6
import QtQuick.Controls 1.5
import "../../js/utils.js" as Utils
import "../../js/dialog.js" as Dialog

MenuBar {
    property alias recentFilesModel: recentFilesModel
    property alias consoleAI: consoleAI
    property alias log: log

    Menu {
        title: qsTr("File")

        MenuItem {
            text: qsTr("New...")
            shortcut: "Ctrl+N"
            onTriggered: Utils.createDynamicObject(mainRoot, "qrc:/qml/main/NewAI.qml")
        }

        MenuItem {
            text: qsTr("Open...")
            shortcut: "Ctrl+O"
            onTriggered: {
                var selectFileDialog = Dialog.selectFile(mainRoot)
                selectFileDialog.accepted.connect(function() {
                    Utils.openAI(Core.urlToPath(selectFileDialog.fileUrl))
                })
            }
        }

        Menu {
            id: recentFilesMenu
            title: qsTr("Recent Files")
            enabled: recentFilesModel.count > 0

            Instantiator {
                model: recentFilesModel

                MenuItem {
                    text: model.filePath
                    onTriggered: Utils.openAI(text)
                }

                onObjectAdded: recentFilesMenu.insertItem(index, object)
                onObjectRemoved: recentFilesMenu.removeItem(object)
            }

            MenuSeparator {
                visible: recentFilesModel.count > 0
            }

            MenuItem {
                text: qsTr("Clear Menu")
                onTriggered: recentFilesModel.clear()
            }

            ListModel {
                id: recentFilesModel
            }
        }

        MenuSeparator {}

        MenuItem {
            text: qsTr("Close")
            shortcut: "Ctrl+W"
            onTriggered: Utils.closeAI()
        }

        MenuSeparator {}

        MenuItem {
            text: qsTr("Exit")
            shortcut: "Ctrl+Q"
            onTriggered: Qt.quit()
        }
    }

    Menu {
        title: qsTr("Brain")
        visible: Brain.isRunning

        MenuItem {
            text: qsTr("Run")
            shortcut: "F5"
            enabled: Brain.isRunning && Brain.isPaused
            onTriggered: Brain.run()
        }

        MenuItem {
            text: qsTr("Pause")
            shortcut: "F6"
            enabled: Brain.isRunning && !Brain.isPaused
            onTriggered: Brain.pause()
        }
    }

    Menu {
        title: qsTr("View")
        visible: Brain.isRunning

        MenuItem {
            text: qsTr("Zoom In")
            shortcut: StandardKey.ZoomIn
            onTriggered: workArea.camera.zoomIn()
            enabled: workArea.visible
        }

        MenuItem {
            text: qsTr("Zoom Out")
            shortcut: StandardKey.ZoomOut
            onTriggered: workArea.camera.zoomOut()
            enabled: workArea.visible

        }

        MenuItem {
            text: qsTr("Reset")
            shortcut: "F12"
            onTriggered: workArea.camera.reset()
            enabled: workArea.visible
        }
    }

    Menu {
        title: qsTr("Tools")

        MenuItem {
            text: qsTr("Options...")
            onTriggered: Utils.createDynamicObject(mainRoot, "qrc:/qml/main/Options.qml")
        }
    }

    Menu {
        title: qsTr("Window")

        MenuItem {
            id: consoleAI
            text: qsTr("Console")
            shortcut: "Tab"
            checkable: true
            onTriggered: {
                if (checked) {
                    consoleWindow = Utils.createDynamicObject(mainRoot, "qrc:/qml/console/Console.qml")
                } else {
                    consoleWindow.destroy()
                }
            }
        }

        MenuItem {
            id: log
            text: qsTr("Log")
            shortcut: "Ctrl+L"
            checkable: true
            onTriggered: {
                if (checked) {
                    logWindow = Utils.createDynamicObject(mainRoot, "qrc:/qml/main/Log.qml")
                } else {
                    logWindow.destroy()
                }
            }
        }

        MenuItem {
            text: qsTr("Full Screen")
            shortcut: "F11"
            checkable: true
            onTriggered: checked ? mainRoot.showFullScreen() : mainRoot.showNormal()
        }
    }

    Menu {
        title: qsTr("Help")

        MenuItem {
            text: qsTr(String("About %1...").arg(Qt.application.name))
            onTriggered: Utils.createDynamicObject(mainRoot, "qrc:/qml/main/About.qml")
        }
    }
}
