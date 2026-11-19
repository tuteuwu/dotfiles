import Quickshell
import QtQuick
import QtQuick.Shapes
import qs.themes
import qs.widgets.bar

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
    left: 8
    right: 8
  }
  color: "transparent"
  implicitHeight: 32
  Workspace {
    id: workspacesWidget
    barScreen: modelData
    full_width: screen.width / 6
  }
  Clock {
    id: clockWidget
    full_width: screen.width / 16
  }
  MainMenu { currentScreen: modelData}
}