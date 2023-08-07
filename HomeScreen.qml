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

        height: tabSelectorListView.height

        property int currentTabIndexSelected: 0

        ListView {
            id: tabSelectorListView

            height: 60
            width: tabSelector.width - time.width - 10

            spacing: 30

            Component.onCompleted:  {
                console.log(contentWidth)
                console.log(width)
            }

            model: ListModel {
                ListElement { name: qsTr("Your Morning") }
                ListElement { name: qsTr("Home Control") }
            }

            flickableDirection: Flickable.AutoFlickIfNeeded

            delegate: Item {

                height: col.implicitHeight
                width: 200


                MouseArea{
                    anchors.fill: parent
                    onClicked: tabSelector.currentTabIndexSelected = index
                }

                Column {
                    id: col
                    opacity: (tabSelector.currentTabIndexSelected === index) ? 1.0 : 0.7

                    Behavior on opacity {
                        NumberAnimation { duration: 200 }
                    }

                    Label {
                        text: name
                        font.pixelSize: 25
                        color: GlobalProperties.fontColour
                    }

                    spacing: 10

                    Rectangle {
                        height: 3
                        width: 30
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            orientation: ListView.Horizontal
        }

        Label {
            id: time

            anchors {
                right: parent.right
                top: parent.top
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

            margins: 10
        }

        Item {
            ApplianceToggle {
                title: qsTr("Bathroom")
            }
        }

        RoomSelectorTab {
        }
    }
}
