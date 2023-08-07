import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes
import Qt.labs.lottieqt

import openHome

Item {
    ListView {
        id: roomSelector

        property int currentSelectedRoomIndex: 0

        Component.onCompleted: applianceFlowRepeater.model = testRoomModel.getApplianceModel(0)

        anchors {
            top: parent.top
            right: parent.right
            left: parent.left
            leftMargin: 120
        }

        height: 50

        spacing: 50

        //temp
        model: testRoomModel

        flickableDirection: Flickable.AutoFlickIfNeeded

        orientation: ListView.Horizontal

        delegate: Rectangle {

            height: 50
            width: 150

            opacity: (roomSelector.currentSelectedRoomIndex === index) ? 1.0 : 0.7

            Behavior on opacity {
                NumberAnimation { duration: 150 }
            }

            //color: "#4a69bd"
            radius: 5

            gradient: LinearGradient {
                orientation: Gradient.Horizontal
                x1: 20; y1: 20
                x2: 180; y2: 130
                GradientStop { position: 0; color: "#5758bb" }
                GradientStop { position: 0.6; color: "#54a0ff" }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    roomSelector.currentSelectedRoomIndex = model.index
                    applianceFlowRepeater.model = testRoomModel.getApplianceModel(model.index)
                }
            }

            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 0
                verticalOffset: 10
                radius: 14.0
                samples: 20
                color: "#4a69bd" // GlobalProperties.fontColour
            }

            Label {
                id: label
                anchors.centerIn: parent

                text: model.title
                font.pixelSize: (roomSelector.currentSelectedRoomIndex === model.index) ? 20 : 18

                Behavior on font.pixelSize {
                    NumberAnimation { duration: 150 }
                }

                color: GlobalProperties.fontColour
            }
        }
    }

    ScrollView {
        anchors {
            top: roomSelector.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        contentWidth: width
        contentHeight: flow.implicitHeight

        Flow {
            padding: 30
            id: flow
            width: parent.width
            spacing: 20

            add: Transition {
                id: addTrans
                SequentialAnimation {
                    PropertyAction {
                        property: "opacity"
                        value: 0
                    }
                    PauseAnimation {
                        duration: (addTrans.ViewTransition.index -
                                   addTrans.ViewTransition.targetIndexes[0]) * 100
                    }
                    ParallelAnimation {
                        NumberAnimation {
                            property: "opacity"
                            from: 0
                            to: 1
                        }
                        NumberAnimation {
                            property: "translateX"
                            from: 50
                            to: 0
                        }
                    }
                }
            }

            Repeater {
                id: applianceFlowRepeater

                delegate: ApplianceToggle {
                    title: model.title
                    offIcon: model.offIcon
                    onIcon: model.onIcon
                    staticIcon: model.staticIcon
                    type: model.type
                }
            }
        }
    }
}
