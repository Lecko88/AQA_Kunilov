import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 1024
    height: 768
    visible: true
    title: qsTr("Asynchronous Qt Assignment")
    color: Theme.background

    property bool therapyRunning: backend.therapyRunning

    Connections  {
        target: backend

        function onTherapyRunningChanged() {
            if(backend.therapyRunning)
            {
                lungs.start()
            }
            else
            {
                lungs.stop()
            }
        }
    }

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
                height: therapyRunning?0:280
                Layout.preferredHeight: height
                Layout.alignment: Qt.AlignTop
                clip: true
                opacity: therapyRunning?0:1

                Behavior on height {
                    NumberAnimation {
                        duration: 1000
                        easing.type: Easing.Bezier
                    }
                }

                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                        easing.type: Easing.Bezier

                        onStarted: {//make block really unvisible, not just transparent. Can be important, when we set keyboard focus
                            if(!therapyRunning)
                                patientParameters.visible = true
                        }

                        onStopped: {
                            if(therapyRunning && patientParameters.opacity === 0)
                            {
                                patientParameters.visible = false
                            }
                        }
                    }
                }

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

                                    onClicked: {
                                        backend.selectPlanet(modelData.name)
                                    }
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
                                model:IconSets.ageRepeaterModel[backend.currentPlanetId]
                                delegate: RoundedButton {
                                    required property int index //not sure I will use it for now, but VERY important for future Squish testing
                                    required property var modelData

                                    iconSource: modelData.iconSet.icon

                                    onClicked: {
                                        backend.selectAge(modelData.name)
                                    }
                                }
                            }
                        }
                    }




                }
            }
            RoundedTextButton {
                id: startButton
                labelText: therapyRunning?qsTr("Stop"):qsTr("Start healing")
                iconSource: therapyRunning?"icons/hand.svg":"icons/play.svg"
                Layout.alignment: Qt.AlignTop
                z:1
                width: therapyRunning?150:200

                Behavior on width {
                    NumberAnimation {
                        duration: 1000
                        easing.type: Easing.Bezier
                    }
                }

                onClicked: {
                    if(therapyRunning)
                    {
                        backend.stopHealing()
                    }
                    else
                    {
                        backend.startHealing()
                    }
                }
            }
        }

    }

    PulsingImage {
        id: lungs
        source: IconSets.iconSets[backend.currentPlanetId][backend.currentAge].bgImage
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: -200
        anchors.bottomMargin: -200

        width: 500
        height: 500

        maxSize:500
        minSize:400

        color: IconSets.iconSets[backend.currentPlanetId][backend.currentAge].bgColor
        z:-1
    }

    ColorVectorImage {
        id: avatar
        source: IconSets.iconSets[backend.currentPlanetId][backend.currentAge].icon
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: therapyRunning?120:50
        anchors.rightMargin: therapyRunning?120:50

        width: therapyRunning?200:120
        height: therapyRunning?200:120
        color: Theme.foreground

        Behavior on height {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.Bezier
            }
        }

        Behavior on width {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.Bezier
            }
        }

        Behavior on anchors.topMargin {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.Bezier
            }
        }

        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.Bezier
            }
        }
    }
}
