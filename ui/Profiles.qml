import QtQuick 2.0
import Ubuntu.Components 0.1
import "../components"

import Ubuntu.Components.ListItems 0.1 as ListItem
import U1db 1.0 as U1db

    Page {
        id: profilespage
        title: "Profiles"

        tools: ProfilesTools {
            objectName: "Profiles_tools"
        }

        U1db.Index {
            database: db
            id: profiles
            /* You have to specify in the index all fields you want to retrieve
               The query should return the whole document, not just indexed fields
               https://bugs.launchpad.net/u1db-qt/+bug/1271973 */
            expression: ["things.type", "things.placename"]
        }
        U1db.Query {
            id: master
            index: profiles
            query: ["*", "*"]
        }

        ListView {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: parent.width
            model: master
            clip: true
            delegate: ListItem.Standard {
                text: model.contents.placename
                control: Button {
                    width: units.gu(0)
                    onClicked: {
                        pageStack.push(Qt.resolvedUrl("Bag.qml"), {idProfile: model.docId});
                    }
                }            
            }
        }
    }
