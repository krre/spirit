import QtQuick 2.6

SignBase {
    id: root
    color: "lightgreen"

    signal clicked

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: mouseArea.pressed ? 0.2 : 0
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
