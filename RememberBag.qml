import QtQuick 2.0
import Ubuntu.Components 0.1
import "ui"

import U1db 1.0 as U1db

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    
    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "com.ubuntu.developer..RememberBag"
    
    /* 
     This property enables the application to change orientation 
     when the device is rotated. The default is false.
    */
    automaticOrientation: true
    
    width: units.gu(40)
    height: units.gu(60)

    /* ----------------------------------------------------
       Set up the U1DB database
       Declare a named document
       ---------------------------------------------------- */
    U1db.Database { id: db; path: "rememberbag.u1db" }

    PageStack {
        id: pageStack
        Component.onCompleted: pageStack.push(Qt.resolvedUrl("ui/Profiles.qml"))

   }

}
