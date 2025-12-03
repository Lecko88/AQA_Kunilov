import QtQuick

ColorVectorImage {
    id: pulseRect

    property int minSize
    property int maxSize

    property int inDuration: 500
    property int outDuration: 500
    property int smallDuration: 2000
    property int bigDuration: 500

    SequentialAnimation {
        id: pulseAnim
        loops: Animation.Infinite

        ParallelAnimation {
            NumberAnimation {
                target: pulseRect
                property: "width"
                from: maxSize
                to: minSize
                duration: outDuration
            }
            NumberAnimation {
                target: pulseRect
                property: "height"
                from: maxSize
                to: minSize
                duration: outDuration
            }
        }
        PauseAnimation {
            duration: smallDuration
        }
        ParallelAnimation {
            NumberAnimation {
                target: pulseRect
                property: "width"
                from: minSize
                to: maxSize
                duration: inDuration
            }
            NumberAnimation {
                target: pulseRect
                property: "height"
                from: minSize
                to: maxSize
                duration: inDuration
            }
        }
        PauseAnimation {
            duration: bigDuration
        }

    }

    function start() {
        pulseAnim.start()
    }

    function stop() {
        pulseAnim.stop()
        reset()
    }

    function reset() {
        width=maxSize
        height=maxSize
    }
}
