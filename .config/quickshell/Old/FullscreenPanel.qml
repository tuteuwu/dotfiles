import Quickshell
import QtQuick
import qs.themes
import qs.widgets.bar

PanelWindow {
    id: panel

    anchors {
        top: true
        left: true
        right: true
    }

    exclusiveZone: 32

    implicitHeight: 32 + 64

    Column {
        anchors.fill: parent

        Bar {
            id: bar
            implicitHeight: 32
        }

        Menu {
            id: menu
            height: 300
        }
    }
}