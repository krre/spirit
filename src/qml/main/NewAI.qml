import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import "../components"
import "../../js/dialog.js" as Dialog

WindowDialog {
    id: root
    title: qsTr("New AI")
    width: 400
    height: 200

    onAccepted: {
        if (!name.text) {
            stayOnScreen = true
            Dialog.errorMessage(qsTr("Name is empty"))
            name.forceActiveFocus()
        } else {
            var filePath = Settings.value("Path", "workspace") + "/" + name.text
            if (Core.isFileExists(filePath)) {
                stayOnScreen = true
                var warningDialog = Dialog.warningMessage(qsTr("File is exists. Overwrite?"))
                warningDialog.yes.connect(function() {
                    Core.removeFile(filePath)
                    print("Create", name.text)
                    root.destroy()
                })
            } else {
                print("Create", name.text)
                root.destroy()
            }
        }
    }

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
    }
}
