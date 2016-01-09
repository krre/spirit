import QtQuick 2.6

SignBase {
    text: name
    onClicked: {
        humanSigns.set(humanView.currentIndex, { name: name, sign: sign })
        humanView.incrementCurrentIndex()
    }
}
