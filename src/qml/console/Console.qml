import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import "sign"
import "../../js/utils.js" as Utils

Window {
    title: qsTr("Console")
    width: 310
    height: 535
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

    ListModel {
        id: listModel

        Component.onCompleted: {
            for (var i = 0; i < 10; i++) {
                append({ name: qsTr("Sign ") + i })
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 7

        RowLayout {
            Layout.alignment: Qt.AlignHCenter

            Rectangle {
                width: 70
                height: 70
                color: "#5fbffe"
                border.width: 1
                border.color: "blue"
            }

            Rectangle {
                width: 70
                height: 70
                color: "#5fbffe"
                border.width: 1
                border.color: "blue"
            }

            Rectangle {
                width: 70
                height: 70
                color: "#5fbffe"
                border.width: 1
                border.color: "blue"
            }

            Rectangle {
                width: 70
                height: 70
                color: "#5fbffe"
                border.width: 1
                border.color: "blue"
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter

            Rectangle {
                width: 70
                height: 70
                color: "#fca5a5"
                border.width: 1
                border.color: "red"
            }

            Rectangle {
                width: 70
                height: 70
                color: "#fca5a5"
                border.width: 1
                border.color: "red"
            }
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true

            SignButton {
                text: qsTr("Change")
                onClicked: print(text)
            }

            SignButton {
                text: qsTr("Clear")
                onClicked: print(text)
            }

            SignButton {
                text: qsTr("New")
                onClicked: print(text)
            }

            SignButton {
                text: qsTr("Push")
                onClicked: print(text)
            }
        }
    }
}
