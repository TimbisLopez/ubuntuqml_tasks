import QtQuick 2.0
import Ubuntu.Components 0.1
import "../components"

import Ubuntu.Components.ListItems 0.1 as ListItem
import U1db 1.0 as U1db

    Page {
        id: bagpage
        title: "My Bag"
        tools: BagTools {
            objectName: "Bag_tools"
        }
        property string idProfile

        U1db.Index {
            database: db
            id: bag
            /* You have to specify in the index all fields you want to retrieve
               The query should return the whole document, not just indexed fields
               https://bugs.launchpad.net/u1db-qt/+bug/1271973 */
            expression: ["things2.type", "things2.placename"]
        }
        U1db.Query {
            id: slave
            index: bag
            query: [{"type":bagpage.idProfile,"placename":"*"}]
        }

        ListView {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: parent.width
            model: slave
            clip: true
            delegate: ListItem.Standard {
                text: model.contents.placename
                control: Button {
                    text: "x"
                    width: units.gu(4)
                    onClicked: {
                        /* To delete a document, you currently have to set its
                           contents to empty string. There will be db.delete_doc
                           eventually.
                           https://bugs.launchpad.net/u1db-qt/+bug/1243395 */
                        db.putDoc("", model.docId);
                    }
                }
            }
        }
    }
