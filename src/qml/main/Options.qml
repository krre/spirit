import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import QtQuick.Window 2.2
import "../components"

WindowDialog {
    id: root
    title: qsTr("Options")
    width: 500
    height: 200

    onAccepted: {
        Settings.setValue("Path", "workspace", workspacePath.text)
    }

    ColumnLayout {
        width: parent.width

        GroupBox {
            title: qsTr("Directory")
            Layout.preferredWidth: parent.width

            GridLayout {
                width: parent.width
                columns: 3

                Label {
                    text: qsTr("Workspace:")
                }

                TextField {
                    id: workspacePath
                    Layout.fillWidth: true
                    text: Settings.value("Path", "workspace", Core.homePath + Core.separator + "spirit")
                    Component.onCompleted: forceActiveFocus()
                }

                BrowseButton {
                    onClicked: {
                        var selectDirectoryDialog = Dialog.selectDirectory(root)
                        selectDirectoryDialog.accepted.connect(function() {
                            workspacePath.text = UTILS.urlToPath(selectDirectoryDialog.fileUrl)
                        })
                    }
                }
            }
        }
    }
}

