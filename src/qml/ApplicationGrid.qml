import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import com.iktwo.qutelauncher 1.0

GridView {
    id: root

    property int highlightedItem

    //signal pressAndHold(var model)

    maximumFlickVelocity: height * 2.5

    header: Item {
        width: parent.width
        height: 20 * ScreenValues.dp
    }
/*
    add: Transition {
        NumberAnimation { properties: "opacity"; from: 0; to: 1; duration: 450 }
        NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 500 }
    }

    displaced: Transition {
        NumberAnimation { property: "opacity"; to: 1.0 }
        NumberAnimation { property: "scale"; to: 1.0 }
    }
*/

    clip: true
    interactive: visible

    cellHeight: height/3
    cellWidth: width/6

    delegate: ApplicationTile {
        id: applicationTile

        height: GridView.view.cellHeight
        width: GridView.view.cellWidth

        source: "image://icon/" + model.packageName
        text: model.name

        onClicked: PackageManager.launchApplication(model.packageName)
        //onPressAndHold: root.pressAndHold(model)
    }
/*
    onHeightChanged: {
        if (cacheBuffer !== 0)
            cacheBuffer = Math.max(1080, height * 5)
    }
    */
}
