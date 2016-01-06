import QtQuick 2.6

SignBase {
    color: sign == -1 ? "transparent" : (ListView.isCurrentItem ? "yellow" : "#fca5a5")
    border.color: ListView.isCurrentItem ? "red" : "violet"
    text: name
    onClicked: ListView.view.currentIndex = index
    onDoubleClicked: humanSigns.set(index, { name: "", sign: -1 })
}
