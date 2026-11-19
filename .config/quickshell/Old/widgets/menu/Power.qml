import Quickshell
import QtQuick
import Quickshell.Io
import Qt5Compat.GraphicalEffects
import "../../themes"


Rectangle {
  anchors.fill: parent
  property bool cursorOnButton
  color: "transparent"
  cursorOnButton: power.containsMouse || restart.containsMouse || logout.containsMouse
  Column {
    anchors.fill: parent
    anchors.topMargin: Ui.margins1
    anchors.bottomMargin: Ui.margins1
    Rectangle {
      anchors.top: parent.top
      width: power.containsMouse ? parent.parent.width / 2 : 32
      height: 32
      anchors.horizontalCenter: parent.horizontalCenter
      color: power.containsMouse ? Colors.accent0 : Colors.overlay0
      radius: Ui.radius
      Text {
        anchors.centerIn: parent
        color: Colors.crust
        font.pixelSize: Fonts.size2
        font.family: Fonts.mono
        horizontalAlignment: Text.AlignHCenter
        text: "󰐥"
      }
      MouseArea {
        id: power
        anchors.fill: parent
        hoverEnabled: true
        onClicked: poweroffProc.running = true
      }
      Process {
        id: poweroffProc
        command: ["shutdown", "now"]
      }
      Behavior on width { NumberAnimation {
        duration: Ui.animationSpeed1
        easing.type: Ui.animationEasing1
      } }
    }
    Rectangle {
      anchors.verticalCenter: parent.verticalCenter
      width: restart.containsMouse ? parent.parent.width / 2 : 32
      height: 32
      anchors.horizontalCenter: parent.horizontalCenter
      color: restart.containsMouse ? Colors.accent0 : Colors.overlay0
      radius: Ui.radius
      Text {
        anchors.centerIn: parent
        color: Colors.crust
        font.pixelSize: Fonts.size2
        font.family: Fonts.mono
        horizontalAlignment: Text.AlignHCenter
        text: "󰑙"
      }
      MouseArea {
        id: restart
        anchors.fill: parent
        hoverEnabled: true
        onClicked: restartProc.running = true
      }
      Process {
        id: restartProc
        command: ["reboot"]
      }
      Behavior on width { NumberAnimation {
        duration: Ui.animationSpeed1
        easing.type: Ui.animationEasing1
      } }
    }
    Rectangle {
      anchors.bottom: parent.bottom
      width: logout.containsMouse ? parent.parent.width / 2 : 32
      height: 32
      anchors.horizontalCenter: parent.horizontalCenter
      color: logout.containsMouse ? Colors.accent0 : Colors.overlay0
      radius: Ui.radius
      Text {
        anchors.centerIn: parent
        color: Colors.crust
        font.pixelSize: Fonts.size2
        font.family: Fonts.mono
        horizontalAlignment: Text.AlignHCenter
        text: "󰗽"
      }
      MouseArea {
        id: logout
        anchors.fill: parent
        hoverEnabled: true
        onClicked: logoutProc.running = true
      }
      Process {
        id: logoutProc
        command: ["hyprctl", "dispatch", "'hl.dsp.exit()'"]
      }
      Behavior on width { NumberAnimation {
        duration: Ui.animationSpeed1
        easing.type: Ui.animationEasing1
      } }
    }
  }
}