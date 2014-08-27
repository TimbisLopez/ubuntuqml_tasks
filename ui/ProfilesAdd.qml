import QtQuick 2.0
import Ubuntu.Components 0.1

import U1db 1.0 as U1db

Page {
    title: "Add profile"

    Column {
        id: col
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        spacing: units.gu(1)

        Rectangle {
            id: ta
            width: parent.width - units.gu(2)
            color: "white"
            height: inp.height * 2
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 5
            TextInput {
                id: inp
                width: parent.width - units.gu(2)
                anchors.centerIn: parent
                onAccepted: inp.adddoc()

                function adddoc() {
                    /* Indexes do not work on top-level fields. So put everything
                       in the document in a dict called "things" so that they're
                       not top-level fields any more.
                       https://bugs.launchpad.net/u1db-qt/+bug/1271972 */
                    db.putDoc({things: {type: "place", placename: inp.text}})
                    inp.text = ""
                    pageStack.pop();
                }
            }
        }
        Button {
            text: "Add"
            width: ta.width
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: inp.adddoc()
        }
    }
}
