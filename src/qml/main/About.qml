import QtQuick 2.6
import QtQuick.Dialogs 1.2

MessageDialog {
    title: qsTr(String("About %1").arg(Qt.application.name))
    standardButtons: StandardButton.Ok
    text: String("<h3>%1 %2</h3>
          Based on Qt %3<br>
          Build on %4<br><br>
          Copyright © 2015, Vladimir Zarypov").arg(Qt.application.name).arg(Qt.application.version).arg(Core.qtVersion).arg(Core.buildDate)
    onVisibleChanged: if (!visible) destroy()
    Component.onCompleted: open()
}
