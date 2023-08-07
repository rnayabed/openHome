import QtQuick
import QtQuick.Window

import QtQuick.Controls
import QtQuick.Controls.Material
import Qt5Compat.GraphicalEffects

ApplicationWindow {
    width: 1024
    height: 600
    visible: true
    title: qsTr("OpenHome")

    color: GlobalProperties.backgroundColour

    Image {
        anchors.fill: parent

        source: "qrc:/openHome/test-wall.jpg"
        smooth: true

        fillMode: Image.PreserveAspectCrop
        z: -1
        opacity: 0.3
    }

    id: window

    font: GlobalProperties.fontLoader.font

    MultiPointTouchArea {
        id: lockScreenTouch
        anchors.fill: parent
        touchPoints: [
            TouchPoint { id: point1 }
        ]

        property bool enabled: false //true
        property real startY: 0
        onTouchUpdated: list => {
                            if (!enabled) return
                            if (point1.pressed) {
                                if (startY == 0) {
                                    startY = point1.y
                                }

                                lockScreen.y = (point1.y - startY)

                                lockScreenAnimation.velocity= -1
                            } else {
                                if (lockScreen.y < -(window.height * 0.3) || point1.velocity.y <= -900) {
                                    lockScreenAnimation.velocity = 1500
                                    lockScreen.y = -(window.height)
                                    enabled = false
                                } else {
                                    lockScreenAnimation.velocity = 500
                                    lockScreen.y = 0;
                                    startY = 0;
                                }
                            }
                        }
        }

    LockScreen {
        z: 1
        y:-(window.height)  // remove later
        id: lockScreen
        Component.onCompleted: {
            height = window.height
            width = window.width
        }

        Behavior on y { SmoothedAnimation { id: lockScreenAnimation;} }
    }

    HomeScreen {

    }
}
