import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Item {
    anchors.fill: parent

    property alias clockRunning: clockTimer.running

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

            spacing: 15

            property string firstTabHeading: ""

            // fixme: refactor
            model: ListModel {
                ListElement { name: "" }
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
                        text: index === 0 ? tabSelectorListView.firstTabHeading : name
                        font.pixelSize: 25
                        color: GlobalProperties.fontColour
                    }

                    spacing: 10

                    Rectangle {
                        height: 3
                        width: 30
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter

                        opacity: (tabSelector.currentTabIndexSelected === index) ? 1.0 : 0.0

                        Behavior on opacity {
                            NumberAnimation { duration: 200 }
                        }

                        transform: Scale {
                            xScale: (tabSelector.currentTabIndexSelected === index) ? 1.0 : 0.0
                            origin.x: 15

                            Behavior on xScale {
                                NumberAnimation { duration: 200 }
                            }
                        }
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

            Timer {
                id: clockTimer
                interval: 1000; running: false; repeat: true
                triggeredOnStart: true
                onTriggered: parent.configureTime()
            }

            property var locale: Qt.locale()
            function configureTime() {
                var d = new Date()
                text = d.toLocaleTimeString(locale, Locale.ShortFormat)

                var h = d.getHours();

                var heading;
                if (h >= 5 && h <= 11)      heading = "Your Morning";
                else if(h >= 12 && h <= 16) heading = "Your Afternoon";
                else if(h >= 17 && h <= 20) heading = "Your Evening";
                else if(h >= 21 || h <= 4)  heading = "Your Night";

                tabSelectorListView.firstTabHeading = heading;
            }

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
            Row {
                anchors.centerIn: parent

                spacing: 20

                Rectangle {
                    radius: 10

                    height: 200
                    width: 200

                    color: "#5ea7c4"

                    layer.enabled: true
                    layer.effect: DropShadow {
                        horizontalOffset: 0
                        verticalOffset: 0
                        radius: 18.0
                        samples: 20
                        color: "#5ea7c4"
                    }

                    Label {
                        anchors {
                            right: parent.right
                            top: parent.top
                            margins: 10
                        }

                        font.pixelSize: 23

                        text: qsTr("Clear")

                        color: GlobalProperties.fontColour
                    }

                    Label  {
                        anchors.centerIn: parent
                        font.pixelSize: 40

                        text: qsTr("31°")

                        color: GlobalProperties.fontColour
                    }

                    Row {
                        anchors {
                            bottom: parent.bottom
                            bottomMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        spacing: 20

                        opacity: 0.8

                        Label {
                            text: qsTr("40°")

                            font.pixelSize: 20
                            color: GlobalProperties.fontColour
                        }

                        Label {
                            text: qsTr("28°")

                            font.pixelSize: 20
                            color: GlobalProperties.fontColour
                        }
                    }

                }

                Rectangle {
                    radius: 10

                    height: 200
                    width: 200

                    color: "#ca09e8"

                    layer.enabled: true
                    layer.effect: DropShadow {
                        horizontalOffset: 0
                        verticalOffset: 0
                        radius: 18.0
                        samples: 20
                        color: "#ca09e8"
                    }

                    Label {
                        anchors {
                            top: parent.top
                            horizontalCenter: parent.horizontalCenter
                            margins: 10
                        }

                        font.pixelSize: 23

                        text: qsTr("Power")

                        color: GlobalProperties.fontColour
                    }

                    Row {
                        anchors.centerIn: parent

                        spacing: 10

                        IconImage {
                            source: "qrc:/icons/bolt.svg"
                            color: GlobalProperties.fontColour
                        }

                        Label  {
                            font.pixelSize: 40

                            text: qsTr("30%")

                            color: GlobalProperties.fontColour
                        }
                    }

                    Label {
                        anchors {
                            bottom: parent.bottom
                            bottomMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }


                        font.pixelSize: 20
                        color: GlobalProperties.fontColour

                        text: qsTr("1580 W")
                    }

                }

                Rectangle {
                    radius: 10

                    height: 200
                    width: 400

                    color: "#ebeced"

                    layer.enabled: true
                    layer.effect: DropShadow {
                        horizontalOffset: 0
                        verticalOffset: 0
                        radius: 18.0
                        samples: 20
                        color: "#ebeced"
                    }


                    Column {
                        anchors {
                            left: parent.left
                            top: parent.top
                            margins: 20
                        }

                        spacing: 5

                        Row {
                            spacing: 20

                            Image {
                                source: "qrc:/icons/event_note.svg"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Label {
                                font.pixelSize: 33
                                text: qsTr("August 8")
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            bottomPadding: 10
                        }

                        Repeater {
                            model: ListModel {
                                ListElement { note: "Submit assignment" }
                                ListElement { note: "Buy 500 L of Kerosene" }
                                ListElement { note: "Buy Flamethrower" }
                                ListElement { note: "Buy knife" }
                            }

                            delegate: Label {
                                font.pixelSize: 16
                                text: "• " + note
                            }
                        }
                    }
                }
            }
        }

        Item {
            RoomSelectorTab {
                anchors {
                    fill: parent
                    margins: 20
                }
            }
        }
    }
}
