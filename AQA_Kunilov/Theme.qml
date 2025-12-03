pragma Singleton

import QtQuick

QtObject {
    property bool dark: false
    property color background: dark?"#696969":"#FFFFFF"
    property color foreground: dark?"#FFFFFF":"#696969"
}
