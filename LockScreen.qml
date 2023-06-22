import QtQuick
import QtQuick.Controls

Item {
    Image {
        anchors.fill: parent

        source: "test-wall.jpg"
        smooth: true

        fillMode: Image.PreserveAspectCrop
    }

    Item {
        anchors {
            left: parent.left
            bottom: parent.bottom
            margins: 20
        }

        height: column.implicitHeight
        width: column.implicitWidth

        Column {
            id: column
            anchors.fill: parent

            spacing: 10

            Label {
                text: qsTr("15:30")
                color: GlobalProperties.fontColour
                font.pixelSize: 100
                font.family: "Lato"
            }

            Label {
                color: GlobalProperties.fontColour
                text: qsTr("Sunday, 18 Jun")
                font.pixelSize: 50
            }

            Label {
                color: GlobalProperties.fontColour
                text: qsTr("33° C")
                font.pixelSize: 40
            }
        }
    }
}
