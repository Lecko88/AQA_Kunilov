import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Rectangle {
    id: roundedButton

    property string iconSource
    property int iconSize: 40

    width: 72
    height: 72

    signal clicked

    radius: 18

    color: Theme.background

    border.width: 1
    border.color: Theme.foreground

    ColorVectorImage {
        id: icon
        width: parent.iconSize
        height: parent.iconSize
        anchors.centerIn: parent
        source: parent.iconSource
        color: Theme.foreground
    }

    MultiEffect {
        anchors.fill: parent

        source: parent

        shadowEnabled: true
        shadowColor: Theme.foreground
        shadowHorizontalOffset: 1
        shadowVerticalOffset: 4

        shadowBlur: 0
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.clicked()
        }
    }
}
