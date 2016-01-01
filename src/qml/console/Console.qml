import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import "sign"
import "../../js/utils.js" as Utils

Window {
    title: qsTr("Console")
    minimumWidth: 310
    minimumHeight: 535
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
        id: listModel0

        Component.onCompleted: {
            for (var i = 0; i < 10; i++) {
                append({ name: qsTr("Sign 0") + i })
            }
        }
    }

    ListModel {
        id: listModel1

        Component.onCompleted: {
            for (var i = 0; i < 10; i++) {
                append({ name: qsTr("Sign 1") + i })
            }
        }
    }

    ListModel {
        id: listModel2

        Component.onCompleted: {
            for (var i = 0; i < 10; i++) {
                append({ name: qsTr("Sign 2") + i })
            }
        }
    }

    ListModel {
        id: listModel3

        Component.onCompleted: {
            for (var i = 0; i < 10; i++) {
                append({ name: qsTr("Sign 3") + i })
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 7

        RowLayout {
            Layout.alignment: Qt.AlignHCenter

            SpiritSign {}

            SpiritSign {}

            SpiritSign {}

            SpiritSign {}
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter

            HumanSign {}

            HumanSign {}

            HumanSign {}

            HumanSign {}
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel0
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel1
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel2
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel3
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
