import QtQuick 2.6
import QtQuick.Controls 1.5

MenuBar {

    Menu {
        title: qsTr("File")

        MenuItem {
            text: qsTr("Exit")
            shortcut: "Ctrl+Q"
            onTriggered: Qt.quit()
        }
    }
}
