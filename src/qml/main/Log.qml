import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import "../components"
import "../../js/utils.js" as Utils

WindowDialog {
    title: qsTr("Log")
    width: 600
    height: 500
    modality: Qt.NonModal
    hideButtons: true
    settingsGroup: "Log"
}