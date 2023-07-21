import QtQuick
import QtQuick.Controls

import Qt5Compat.GraphicalEffects

Item {
    anchors.fill: parent

    Item {
        id: tabSelector

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 20
        }

        implicitHeight: Math.max(time.implicitHeight)

        property int currentTabIndexSelected: 0

        ListView {
            height: 100
            width: tabSelector.width - time.width - 10

            spacing: 30

            Component.onCompleted:  {
                console.log(contentWidth)
                console.log(width)
            }

            model: ListModel {
                ListElement { name: qsTr("Bed Room") }
                ListElement { name: qsTr("Home Control") }
                ListElement { name: qsTr("Media") }
                ListElement { name: qsTr("Communicate") }
            }

            flickableDirection: Flickable.AutoFlickIfNeeded

            delegate: Label {
                text: name
                font.pixelSize: 25
                color: GlobalProperties.fontColour
                opacity: (tabSelector.currentTabIndexSelected === index) ? 1.0 : 0.7

                Behavior on opacity {
                    NumberAnimation { duration: 200 }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: tabSelector.currentTabIndexSelected = index
                }
            }

            orientation: ListView.Horizontal
        }

        Label {
            id: time

            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            text: qsTr("15:30")
            font.pixelSize: 25
            color: GlobalProperties.fontColour
        }
    }

    SwipeView {
        id: tabView

        currentIndex: tabSelector.currentTabIndexSelected
        interactive: false

        anchors {
            left: parent.left
            right: parent.right
            top: tabSelector.bottom
            bottom: parent.bottom
        }

        Item {

            Rectangle {
                MouseArea {
                    id: toggleMouseArea
                    anchors.fill:  parent
                    onClicked: {

                        enabled = false
                        testLightsToggle.status = !testLightsToggle.status

                        switchController.switch1 = testLightsToggle.status

                        testLightsToggle.configureColour()
                    }
                }

                property bool status: false


                id: testLightsToggle
                anchors.centerIn: parent

                Component.onCompleted: {
                    configureColour()
                    color = animation.to
                }

                function configureColour() {
                    if (status) {
                        animation.to = "#db7b44"
                    } else {
                        animation.to = "#475C7A"
                    }

                    animation.running = true
                }

                ColorAnimation on color {
                    id: animation
                    duration: 100

                    onFinished: toggleMouseArea.enabled = true
                }

                radius: 10

                height: Math.max(col.implicitHeight, col.implicitWidth) + 50
                width: height


                layer.enabled: true
                layer.effect: DropShadow {
                    horizontalOffset: 0
                    verticalOffset: 0
                    radius: 18.0
                    samples: 20
                    color: "#475C7A"
                }

                Column {
                    id: col

                    anchors {
                        centerIn: parent
                    }

                    spacing: 10
                    Label {
                        color: GlobalProperties.fontColour
                        text: qsTr("Lights")
                        font.pixelSize: 40
                    }

                    Label {
                        color: GlobalProperties.fontColour
                        text: testLightsToggle.status ? qsTr("On") : qsTr("Off")
                        font.pixelSize: 20
                    }

                    layer.enabled: true
                    layer.effect: DropShadow {
                        horizontalOffset: 0
                        verticalOffset: 0
                        radius: 5.0
                        samples: 20
                        color: "grey"
                    }
                }
            }

        }

        Item {
            Label {
                anchors.centerIn: parent
                text: qsTr("Page 1")
                font.pixelSize: 25
                color: GlobalProperties.fontColour
            }
        }

        Item {
            Label {
                anchors.centerIn: parent
                text: qsTr("Page 2")
                font.pixelSize: 25
                color: GlobalProperties.fontColour
            }
        }

        Item {
            Label {
                anchors.centerIn: parent
                text: qsTr("Page 3")
                font.pixelSize: 25
                color: GlobalProperties.fontColour
            }
        }
    }
}
