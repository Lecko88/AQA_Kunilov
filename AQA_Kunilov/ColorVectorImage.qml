import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: container

    property string source
    property string color
    Image {
        id: icon

        anchors.fill: parent
        source: parent.source
        visible: false
        fillMode: Image.PreserveAspectFit
        smooth:true
    }

    ColorOverlay {
        anchors.fill: icon
        source: icon
        color: parent.color
    }
}
