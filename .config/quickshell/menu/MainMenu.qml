import Quickshell
import Quickshell.Wayland
import QtQuick
import "../themes"
import "./widgets"

PanelWindow {
  id: root
  property bool deployed: false
  implicitWidth: 1
  implicitHeight: 1
  color: "transparent"
  visible: root.deployed
  anchors {
    top: true
    bottom: true
    left: true
    right: true
  }

  aboveWindows: true
  exclusiveZone: 0
  WlrLayershell.layer: WlrLayer.Overlay

  Rectangle {
    width: 512
    height: 768
    anchors.centerIn: parent

    color: Colors.base1
    Rectangle {
      id: powerWidget
      anchors.right: parent.right
      anchors.top: parent.top
      color: "Transparent"
      width: 256
      height: 96
      Power { }
    }
    Rectangle {
      anchors.right: parent.right
      anchors.top: powerWidget.bottom
      color: "Transparent"
      width: 256
      height: 32
      Energy { }
    }
  }
}
