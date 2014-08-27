import QtQuick 2.0
import Ubuntu.Components 0.1

ToolbarItems {
    ToolbarButton {
        iconSource: Qt.resolvedUrl("../graphics/toolbarIcon.png")
        text: i18n.tr("Añadir")
        
        onTriggered: {
            pageStack.push(Qt.resolvedUrl("BagAdd.qml"), {idProfile: bagpage.idProfile});
        }
    }
    ToolbarButton {
        iconSource: Qt.resolvedUrl("../graphics/toolbarIcon.png")
        text: i18n.tr("Del Profile")

        onTriggered: {
            db.putDoc("", bagpage.idProfile);
            pageStack.push(Qt.resolvedUrl("Profiles.qml"));
        }
    }
}
