import QtQuick 2.6

Rectangle {
    id: root
    property alias text: text.text
    width: 70
    height: 70
    border.width: 1
    border.color: "gray"

    signal clicked

    Text {
        id: text
        anchors.centerIn: parent
    }

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
