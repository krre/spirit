import QtQuick 2.6

Rectangle {
    id: root
    property alias text: text.text
    property bool isClickable: true
    width: 70
    height: 70
    border.width: 1
    border.color: "gray"

    signal clicked

    Text {
        id: text
        anchors.fill: parent
        anchors.margins: 5
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        clip: true
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: mouseArea.pressed ? 0.2 : 0
        visible: isClickable
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: root.clicked()
        visible: isClickable
    }
}
