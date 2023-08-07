import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Controls

import Qt.labs.lottieqt

import openHome

Rectangle {
    MouseArea {
        id: toggleMouseArea
        anchors.fill:  parent
        onClicked: {

            enabled = false
            toggle.status = !toggle.status

            rotation.running = status && type === ApplianceType.Rotate

       //     switchController.switch1 = toggle.status

            toggle.configureColour()
        }
    }

    transform: Translate {
        id: translate
        x: 0
    }

    property alias translateX: translate.x

    property bool status: false

    property alias title: titleLabel.text

    property int pin: -1
    property string offIcon: ""
    property string onIcon: ""
    property string staticIcon:  ""

    property int type: ApplianceType.Normal

    id: toggle

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

    height: 110
    width: 280

   // height: col.implicitHeight + 50
   // width: col.implicitWidth + 50

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
            left: parent.left
            margins: 20
            verticalCenter: parent.verticalCenter
        }

        clip: true

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
    }

    Image {
        anchors {
            right: parent.right
            bottom: parent.bottom
            rightMargin: 5
            bottomMargin: 5
        }

        RotationAnimation on rotation {
            id: rotation
            running: false
            loops: Animation.Infinite
            from: 0
            to: 360
            duration: 800
        }

        id: weatherIcon
        source: (type === ApplianceType.Rotate) ? Icons.get(Icons.Fan) :
                    (type === ApplianceType.Static) ? staticIcon :
                    (toggle.status ? onIcon : offIcon)

        layer.enabled: true
        layer.effect: ColorOverlay{
            color: GlobalProperties.fontColour
            antialiasing: true
        }
    }
}
