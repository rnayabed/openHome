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
        id: wallpaper

        source: "qrc:/openHome/test-wall.jpg"
        smooth: true

        fillMode: Image.PreserveAspectCrop
        z: -1

        opacity: 0.8

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }

    id: window

    font: GlobalProperties.fontLoader.font

    MultiPointTouchArea {
        id: lockScreenTouch
        anchors.fill: parent
        touchPoints: [
            TouchPoint { id: point1 }
        ]

        property bool enabled: true
        property real startY: 0
        onTouchUpdated: list => {
            if (!enabled) return
            if (point1.pressed) {
                if (startY == 0) {
                                    startY = point1.y
                                }

                                lockScreenTranslateAnimation.velocity= -1

                                var newTranslate = (point1.y - startY)

                                if (newTranslate < 0) {
                                    lockScreenTranslate.y = newTranslate
                                }

                            } else {
                                if (lockScreenTranslate.y < -(window.height * 0.25) || point1.velocity.y <= -900) {

                                    lockScreenTranslateAnimation.velocity = 1500
                                    lockScreenTranslate.y = -(window.height)


                                    homeScreen.clockRunning = true

                                    lockScreen.visible = false
                                    homeScreen.visible = true
                                    homeScreen.opacity = 1.0

                                    lockScreen.clockRunning = false

                                    wallpaper.opacity = 0.3
                                    enabled = false
                                } else {
                                    lockScreenTranslateAnimation.velocity = 300
                                    lockScreenTranslate.y = 0;
                                    startY = 0;
                                }
                            }
                        }
        }

    LockScreen {

        id: lockScreen

        clockRunning: true

        transform: Translate {
            id: lockScreenTranslate

            Behavior on y {
                SmoothedAnimation {
                    id: lockScreenTranslateAnimation
                }
            }
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }
    }

    HomeScreen {
        id: homeScreen

        opacity: 0
        visible: false

        transform: Translate {
            id: homeScreenTranslate

            Behavior on x {
                NumberAnimation {
                    duration: 200
                }
            }
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }
    }
}
