import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 1024
    height: 768
    visible: true
    title: qsTr("Asynchronous Qt Assignment")
    color: Theme.background

    property bool therapyRunning: false

    Item {
        id: leftPanel
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 30

        width: 700

        ColumnLayout {
            id: leftColumn

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            spacing: 25

            RowLayout {
                id: topRow
                spacing: 10

                RoundedButton {
                    id: powerOffButton
                    iconSource: "icons/power-off.svg"
                    onClicked: console.log("Clicked power button")//IMHO showing the assignment text is not a part of the assignment
                }

                RoundedButton {
                    id: darkModeButton
                    iconSource: "icons/circle-half-stroke.svg"

                    onClicked: {
                        Theme.dark = !Theme.dark
                    }
                }
            }

            Item { //Will be clipped off when therapy starts
                id: patientParameters
                Layout.fillWidth: true
                height: 280 //here will be  some logic
                Layout.preferredHeight: height
                Layout.alignment: Qt.AlignTop

                ColumnLayout {
                    id: patientParametersContent
                    anchors.fill: parent
                    spacing: 20

                    ColumnLayout {
                        id: planetWidget
                        Layout.alignment: Qt.AlignTop
                        spacing: 10
                        Label {
                            text: qsTr("Favourite planet:")
                            color: Theme.foreground
                        }

                        RowLayout {
                            spacing: 10
                            Repeater {
                                model: [
                                    { icon: "icons/mars.svg", name: "Mars" },
                                    { icon: "icons/venus.svg", name: "Venus" }
                                ]
                                delegate: RoundedButton {
                                    required property int index //not sure I will use it for now, but VERY important for future Squish testing
                                    required property var modelData

                                    iconSource: modelData.icon
                                }
                            }
                        }
                    }

                    ColumnLayout {
                        id: ageGroupWidget
                        Layout.alignment: Qt.AlignTop
                        spacing: 10

                        Label {
                            text: qsTr("Age group:")
                            color: Theme.foreground
                        }

                        RowLayout {
                            spacing: 10
                            Repeater {
                                model:IconSets.ageRepeaterModel["Venus"] //here will be some logic
                                delegate: RoundedButton {
                                    required property int index //not sure I will use it for now, but VERY important for future Squish testing
                                    required property var modelData

                                    iconSource: modelData.iconSet.icon
                                }
                            }
                        }
                    }

                    RoundedTextButton {
                        id: startButton
                        labelText: therapyRunning?qsTr("Stop"):qsTr("Start healing")
                        iconSource: therapyRunning?"icons/hand.svg":"icons/play.svg"
                        Layout.alignment: Qt.AlignTop
                    }


                }
            }
        }

    }

    PulsingImage {
        id: lungs
        source: "icons/lungs.svg" //from model later
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: -200
        anchors.bottomMargin: -200

        width: 500
        height: 500

        color: "red" //from model later
    }

    ColorVectorImage {
        id: avatar
        source: "icons/person.svg" //from model later
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 50
        anchors.rightMargin: 50

        width: 120
        height: 120
        color: Theme.foreground
    }
}
