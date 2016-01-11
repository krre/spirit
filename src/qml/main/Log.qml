import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import Spirit 1.0
import "../components"
import "../../js/utils.js" as Utils

WindowDialog {
    title: qsTr("Log")
    width: 600
    height: 500
    modality: Qt.NonModal
    indent: 0
    hideButtons: true
    settingsGroup: "Log"

    Component.onCompleted: reloadLog()

    function reloadLog() {
        textArea.text = ""
        var logList = Core.loadList(Brain.logPath())
        for (var i in logList) {
            textArea.append(logList[i])
        }
    }

    FileWatcher {
        id: fileWatcher
        filePath: Brain.logPath()
        onFileChanged: reloadLog()
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Button {
            Layout.margins: 7
            text: qsTr("Clear")
            onClicked: {
                Core.saveList(Brain.logPath(), [])
            }
        }

        TextArea {
            id: textArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            readOnly: true
        }
    }
}
