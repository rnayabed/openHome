import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Controls

Rectangle {
    MouseArea {
        id: toggleMouseArea
        anchors.fill:  parent
        onClicked: {

            enabled = false
            toggle.status = !toggle.status

       //     switchController.switch1 = toggle.status

            toggle.configureColour()
        }
    }

    property bool status: false

    property alias title: titleLabel.text
    //property int pin:


    id: toggle
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

    height: col.implicitHeight + 50
    width: col.implicitWidth + 50


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
            id: titleLabel
            color: GlobalProperties.fontColour
            font.pixelSize: 40
        }

        Label {
            color: GlobalProperties.fontColour
            text: toggle.status ? qsTr("On") : qsTr("Off")
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
