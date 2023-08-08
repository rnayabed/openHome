import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Item {
    anchors.fill: parent

    property alias clockRunning: clockTimer.running

    Timer {
        id: clockTimer
        interval: 1000; running: false; repeat: true
        triggeredOnStart: true
        onTriggered: parent.configureTime()
    }

    property var locale: Qt.locale()
    function configureTime() {
        var d = new Date()
        time.text = d.toLocaleTimeString(locale, Locale.ShortFormat)
    }

    Column {
        anchors {
            centerIn: parent
        }

        spacing: 20

        Label {
            id: time
            font.pixelSize: 75
            color: GlobalProperties.fontColour

            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: dateL
            font.pixelSize: 40
            color: GlobalProperties.fontColour
            text: qsTr("Tuesday, August 8")

            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Label {
        anchors {
            bottom: parent.bottom
            bottomMargin: 30
            horizontalCenter: parent.horizontalCenter
        }

        color: GlobalProperties.fontColour

        text: qsTr("Swipe up to unlock")

        font.pixelSize: 18
    }
}
