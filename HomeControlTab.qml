import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Controls


import openHome

Item {
    Row {
        anchors.centerIn: parent

        spacing: 20

        Rectangle {
            id: bedRoom

            color: "#2980B9"

            radius: 10

            height: 200
            width: 200

            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 0
                verticalOffset: 0
                radius: 18.0
                samples: 20
                color: bedRoom.color
            }

            Label {
                anchors.centerIn: parent

                color: GlobalProperties.fontColour
                font.pixelSize: 40

                text: qsTr("Bedroom")
            }
        }

        Rectangle {

            id: livingRoom

            color: "#E67E22"

            radius: 10

            height: 200
            width: 300

            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 0
                verticalOffset: 0
                radius: 18.0
                samples: 20
                color: livingRoom.color
            }

            Label {
                anchors.centerIn: parent

                color: GlobalProperties.fontColour
                font.pixelSize: 40

                text: qsTr("Living Room")
            }
        }

        Rectangle {

            id: garage

            color: "#16A085"

            radius: 10

            height: 200
            width: 200

            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 0
                verticalOffset: 0
                radius: 18.0
                samples: 20
                color: garage.color
            }

            Label {
                anchors.centerIn: parent

                color: GlobalProperties.fontColour
                font.pixelSize: 40

                text: qsTr("Garage")
            }
        }
    }
}
