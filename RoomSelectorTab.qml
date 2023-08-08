import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes

import openHome

Item {
    ListView {
        id: roomSelector

        property int currentSelectedRoomIndex: 0

        anchors {
            top: parent.top
            right: parent.right
            left: parent.left
        }

        height: 50

        spacing: 70

        // TODO: Remove mock model
        model: testRoomModel
        property bool isAssigned: false

        flickableDirection: Flickable.AutoFlickIfNeeded

        orientation: ListView.Horizontal

        delegate: Rectangle {

            height: 50
            width: 160

            opacity: (roomSelector.currentSelectedRoomIndex === model.index) ? 1.0 : 0.6

            Behavior on opacity {
                NumberAnimation { duration: 150 }
            }

            transform: Scale {
                xScale: (roomSelector.currentSelectedRoomIndex === model.index) ? 1 : 0.9
                yScale: (roomSelector.currentSelectedRoomIndex === model.index) ? 1 : 0.9

                origin.x: 80
                origin.y: 25

                Behavior on yScale {
                    NumberAnimation { duration: 150 }
                }

                Behavior on xScale {
                    NumberAnimation { duration: 150 }
                }
            }

            radius: 5

            gradient: LinearGradient {
                orientation: Gradient.Horizontal
                x1: 20; y1: 20
                x2: 180; y2: 130
                GradientStop { position: 0; color: "#5758bb" }
                GradientStop { position: 0.6; color: "#54a0ff" }
            }

            Component.onCompleted: {
                if (!testRoomModel.isAssigned && model.index === 0) {
                    applianceFlowRepeater.model = model.appModel
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    roomSelector.currentSelectedRoomIndex = model.index
                    applianceFlowRepeater.model = model.appModel
                }
            }

            layer.enabled: (roomSelector.currentSelectedRoomIndex === model.index)
            layer.effect: DropShadow {
                horizontalOffset: 0
                verticalOffset: 10
                radius: 14.0
                samples: 20
                color: "#4a69bd"
            }

            Label {
                id: label
                anchors.centerIn: parent

                text: model.title

                font.pixelSize: 20

                color: GlobalProperties.fontColour
            }
        }
    }

    ScrollView {
        anchors {
            top: roomSelector.bottom
            topMargin: 30
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
                                   addTrans.ViewTransition.targetIndexes[0]) * 50
                    }
                    ParallelAnimation {
                        NumberAnimation {
                            property: "opacity"
                            from: 0
                            to: 1
                            duration: 100
                        }
                        NumberAnimation {
                            property: "translateX"
                            from: 25
                            to: 0
                            duration: 100
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
                    status: model.status

                    onMouseAreaClicked: {
                        applianceFlowRepeater.model.toggleAppliance(model.index)
                    }
                }
            }
        }
    }
}
