import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import "../components"
import "../../js/dialog.js" as Dialog
import "../../js/utils.js" as Utils

WindowDialog {
    id: root
    title: qsTr("New AI")
    width: 400
    height: 200

    onAccepted: {
        var filePath = Settings.value("Path", "workspace") + "/" + name.text
        if (Core.isFileExists(filePath)) {
            stayOnScreen = true
            var warningDialog = Dialog.warningMessage(qsTr("File is exists. Overwrite?"))
            warningDialog.yes.connect(function() {
                Core.removeFile(filePath)
                Utils.createAI(filePath)
                stayOnScreen = false
            })
        } else {
            stayOnScreen = false
            Utils.createAI(filePath)
        }
    }

    okButton.enabled: name.text

    GridLayout {
        width: parent.width
        columns: 2

        Label {
            text: qsTr("Name:")
        }

        TextField {
            id: name
            Layout.fillWidth: true
            Component.onCompleted: forceActiveFocus()
        }

        Label {
            text: qsTr("Workspace:")
        }

        Label {
            text: Settings.value("Path", "workspace")
        }
    }
}
