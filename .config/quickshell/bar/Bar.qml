import Quickshell
import QtQuick
import QtQuick.Shapes
import qs.bar.widgets

PanelWindow {
  id: topLevel
  required property var modelData
  screen: modelData

  anchors {
    top: true
    left: true
    right: true
  } 
  margins {
    top: 0
    bottom: 0
    left: 0
    right: 0
  }
  color: "#282828"
  implicitHeight: 32
  Rectangle {
    id: barClock
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    height: parent.height
    width: 128
    color: "Transparent"
    Clock {
      id: clockWidget
    }
  }
  Rectangle {
    id: barWorkspaces
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    height: parent.height
    width: 256
    color: "Transparent"
    Workspace {
      id: workspaceWidget
      barScreen: modelData
    }
  }
  Rectangle {
    id: barTrayIcons
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    height: parent.height
    width: 256
    color: "Transparent"
    TrayIcons {
      id: trayIconsWidget
    }
  }
  
}