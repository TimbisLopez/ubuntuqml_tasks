import QtQuick 2.0
import Ubuntu.Components 0.1

ToolbarItems {
    ToolbarButton {
        iconSource: Qt.resolvedUrl("../graphics/toolbarIcon.png")
        text: i18n.tr("Añadir")

        onTriggered: {
            pageStack.push(Qt.resolvedUrl("ProfilesAdd.qml"));
        }
    }
}

