import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import "sign"

Item {

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 7

        Connections {
            target: Brain
            onAnswered: {
                spiritSigns.clear()
                for (var sign in answer) {
                    spiritSigns.append({ name: answer[sign]})
                }
            }
        }

        ListModel {
            id: spiritSigns
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
            clip: true
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
            clip: true
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel0
            clip: true
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel1
            clip: true
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel2
            clip: true
        }

        ListView {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 70
            orientation: ListView.Horizontal
            spacing: 5
            delegate: SignLib {}
            model: listModel3
            clip: true
        }

        Item {
            Layout.fillHeight: true
        }

        RowLayout {
            Layout.fillWidth: true

            Button {
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                text: qsTr("New")
                onClicked: humanSigns.clean()
            }

            Button {
                Layout.fillWidth: true
                Layout.preferredHeight: 70
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
}
