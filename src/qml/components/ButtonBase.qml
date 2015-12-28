import QtQuick 2.6
import QtQuick.Controls 1.5

Button {
    id: root
    objectName: "ButtonBase"
    activeFocusOnPress: true
    isDefault: activeFocus

    Action {
        shortcut: "Return"
        enabled: root.enabled && root.isDefault
        onTriggered: clicked()
    }
}
