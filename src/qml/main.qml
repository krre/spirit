import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import "main"

ApplicationWindow {
    id: mainRoot
    title: Qt.application.name
    width: 800
    height: 600
    visible: true
    menuBar: MainMenu {}
}
