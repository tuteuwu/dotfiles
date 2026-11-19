import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../../themes"

Rectangle {
  property var barScreen
  anchors.centerIn: parent

  bottomLeftRadius: Ui.radius
  bottomRightRadius: Ui.radius
  color: Colors.base0
  Row {
    anchors.centerIn: parent
    spacing: Ui.margins0
    Repeater {
      model: 8
      Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
        property bool isActive: Hyprland.focusedWorkspace?.id === index + 1
        property bool occupied: ws ? ws.toplevels.values.length > 0 : false
        property bool onScreen: ws ? ws.active : false
        width: (256 - 2 * Ui.margins1) / 8 - Ui.margins0
        height: 16
        radius: Ui.radius
        color: occupied ? (isActive ? Colors.accent0 : Colors.surface2) : Colors.base0
        border.width: Ui.borderWidth
        border.color: isActive ? Colors.accent1 : onScreen ? Colors.accent0 : Colors.base1
        Text {
          anchors.centerIn: parent
          text: ws ? ws.id : index + 1
          font.pixelSize: Fonts.size0
          color: onScreen ? Colors.text : Colors.base1
        }
        MouseArea {
          anchors.fill: parent
          onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + (index + 1) + ", on_current_monitor = true })")
        }
      }
    }
  }
      
}