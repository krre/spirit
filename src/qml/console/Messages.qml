import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import "sign"

ColumnLayout {
    anchors.fill: parent
    anchors.margins: 7

    Connections {
        target: Brain
        onAnswered: print("Answer:", answer)
    }

    ListModel {
        id: spiritSigns

        Component.onCompleted: {
            for (var i = 0; i < 3; i++) {
                append({ name: qsTr("Sign 0") + i })
            }
        }
    }

    ListModel {
        id: humanSigns

        function clean() {
            clear()
            for (var i = 0; i < 4; i++) {
                append({ name: "", sign: -1 })
            }
        }

        Component.onCompleted: clean()
    }

    ListModel {
        id: listModel0

        Component.onCompleted: {
            for (var i = 0; i < 10; i++) {
                append({ name: qsTr("Sign 0") + i, sign: i })
            }
        }
    }

    ListModel {
        id: listModel1

        Component.onCompleted: {
            for (var i = 0; i < 10; i++) {
                append({ name: qsTr("Sign 1") + i, sign: 10 * i })
            }
        }
    }

    ListModel {
        id: listModel2

        Component.onCompleted: {
            for (var i = 0; i < 10; i++) {
                append({ name: qsTr("Sign 2") + i, sign: 20 * i })
            }
        }
    }

    ListModel {
        id: listModel3

        Component.onCompleted: {
            for (var i = 0; i < 10; i++) {
                append({ name: qsTr("Sign 3") + i, sign: 30 * i })
            }
        }
    }

    ListView {
        Layout.preferredWidth: parent.width
        Layout.preferredHeight: 70
        orientation: ListView.Horizontal
        spacing: 5
        delegate: SignSpirit {}
        model: spiritSigns
        interactive: false
    }

    ListView {
        id: humanView
        Layout.preferredWidth: parent.width
        Layout.preferredHeight: 70
        orientation: ListView.Horizontal
        spacing: 5
        delegate: SignHuman {}
        model: humanSigns
        interactive: false
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
        Layout.fillWidth: true
        Layout.fillHeight: true

        SignButton {
            Layout.fillWidth: true
            text: qsTr("New")
            onClicked: humanSigns.clean()
        }

        SignButton {
            Layout.fillWidth: true
            text: qsTr("Send")
            onClicked: {
                var message = []
                for (var i = 0; i < humanSigns.count; i++) {
                    var sign = humanSigns.get(i).sign
                    if (sign !== -1) {
                        message.push(sign)
                    }
                }

                if (message.length) {
                    Brain.sendMessage(message)
                    humanSigns.clean()
                }
            }
        }
    }
}
