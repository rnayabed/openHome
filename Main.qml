import QtQuick
import QtQuick.Window

import QtQuick.Controls
import QtQuick.Controls.Material

Window {
    width: 1024
    height: 600
    visible: true
    title: qsTr("Hello World")


    Column {
        anchors {
            centerIn: parent
        }

        spacing: 30

        Switch {
            text: qsTr("Switch 1")

            checked: switchController.switch1
            onCheckedChanged: switchController.switch1 = checked
        }

        Switch {
            text: qsTr("Switch 2")

            checked: switchController.switch2
            onCheckedChanged: switchController.switch2 = checked
        }

        Switch {
            text: qsTr("Switch 3")

            checked: switchController.switch3
            onCheckedChanged: switchController.switch3 = checked
        }

        Switch {
            text: qsTr("Switch 4")

            checked: switchController.switch4
            onCheckedChanged: switchController.switch4 = checked
        }

        Switch {
            text: qsTr("Switch 5")

            checked: switchController.switch5
            onCheckedChanged: switchController.switch5 = checked
        }

        Switch {
            text: qsTr("Switch 6")

            checked: switchController.switch6
            onCheckedChanged: switchController.switch6 = checked
        }

        Switch {
            text: qsTr("Switch 7")

            checked: switchController.switch7
            onCheckedChanged: switchController.switch7 = checked
        }

        Switch {
            text: qsTr("Switch 8")

            checked: switchController.switch8
            onCheckedChanged: switchController.switch8 = checked
        }


    }

}
