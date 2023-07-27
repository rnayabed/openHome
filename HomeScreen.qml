import QtQuick
import QtQuick.Controls

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
            ApplianceToggle {
                title: qsTr("Bathroom")
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
