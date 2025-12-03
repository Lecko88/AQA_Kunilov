import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Rectangle {
    id: roundedTextButton

    property string iconSource
    property string labelText
    property int iconSize: 40

    width: 200
    height: 72

    signal clicked

    radius: 18

    color: Theme.background

    border.width: 1
    border.color: Theme.foreground

    Label {
        id: label

        anchors.verticalCenter: parent.verticalCenter
        text: parent.labelText
        font.pixelSize: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        color: Theme.foreground
    }

    ColorVectorImage {
        id: icon
        width: parent.iconSize
        height: parent.iconSize
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
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
