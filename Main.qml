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

  /*  Item {
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 20
        }

        height: window.height * 0.6

        Item {
            anchors {
                left: parent.left
                right: parent.horizontalCenter
                top: parent.top
                bottom: parent.bottom
            }

            Column {
                anchors {
                    top: parent.top
                    left: parent.left
                }

                Label {
                    color: GlobalProperties.fontColour
                    text: qsTr("Good morning!");
                    font.pixelSize: 40
                }
            }
        }

        Item {
            id: timeAndWeather
            anchors {
                left: parent.horizontalCenter
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }


            DropShadow {
                anchors.fill: timeAndWeatherRect
                horizontalOffset: 3
                verticalOffset: 3
                radius: 8.0
                color: "blue"
                source: timeAndWeatherRect
            }

            Rectangle {

                id: timeAndWeatherRect
                anchors.centerIn: parent

                color: "red"

                radius: 10

                height: Math.max(col.implicitHeight, 200) + (col.anchors.margins * 2)
                width: Math.max(col.implicitWidth, 200) + (col.anchors.margins * 2)

                Column {
                    id: col

                    anchors {
                        fill: parent
                        margins: 20
                    }

                    spacing: 10
                    Label {
                        color: GlobalProperties.fontColour
                        text: qsTr("10:12")
                        font.pixelSize: 80
                    }

                    Label {
                        color: GlobalProperties.fontColour
                        text: qsTr("Sunday, 18 Jun")
                        font.pixelSize: 25
                    }

                    Label {
                        color: GlobalProperties.fontColour
                        text: qsTr("33° C")
                        font.pixelSize: 20
                    }
                }
            }
        }
    }
*/
}
