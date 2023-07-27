pragma Singleton

import QtQml
import QtQuick

QtObject {
    property string backgroundColour: "black"
    property string fontColour: "white"

    property FontLoader fontLoader: FontLoader {
        source: "fonts/Lato-Regular.ttf"
    }
}
