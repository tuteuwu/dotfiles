import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../../themes"

Rectangle {
  property var barScreen
  property var full_width
  anchors.verticalCenter: parent.verticalCenter
  anchors.left: parent.left

  width: full_width
  height: 32
  bottomLeftRadius: Ui.radius
  bottomRightRadius: Ui.radius
  color: Colors.base
  Row {
    anchors.centerIn: parent
    spacing: Ui.margins0
    Repeater {
      model: 8
      Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
        property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
        property bool occupied: ws?.toplevels.values.length > 0
        property bool onMonitor: ws?.monitor?.name === Hyprland.monitorFor(barScreen)?.name
        property bool onScreen: ws?.active
        width: (full_width - 2 * Ui.margins1) / 8 - Ui.margins0
        height: 16
        radius: Ui.radius
        color: occupied ? (isActive ? Colors.surface2 : Colors.accent0) : Colors.crust
        border.width: Ui.borderWidth
        border.color: isActive ? Colors.accent0 : onScreen ? Colors.accent1 : Colors.crust
        MouseArea {
          anchors.fill: parent
          onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + (index + 1) + ", on_current_monitor = true })")
        }
      }
    }
  }
      
}