import QtQuick 2.6

Rectangle {
    property alias text: text.text
    width: 70
    height: 70
    border.width: 1
    border.color: "gray"

    Text {
        id: text
        anchors.fill: parent
        anchors.margins: 5
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        clip: true
    }
}
