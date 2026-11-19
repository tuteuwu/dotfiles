import Quickshell
import QtQuick
import Quickshell.Io
import "../../themes"

Rectangle {
  anchors.fill: parent
  color: "transparent"
  Row {
    padding: 16
    spacing: 16
    Rectangle {
      width: 64
      height: 64
      color: Colors.surface0
      border.width: 2
      border.color: Colors.text
      Text {
        anchors.centerIn: parent
        color: Colors.text
        font.pixelSize: Fonts.size2
        font.family: Fonts.symbols
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
        command: ["systemctl", "poweroff"]
      }
    }
    Rectangle {
        width: 64
        height: 64
        color: Colors.surface0
        border.width: 2
        border.color: Colors.text
        Text {
            anchors.centerIn: parent
            color: Colors.text
            font.pixelSize: Fonts.size2
            font.family: Fonts.symbols
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
          command: ["systemctl", "reboot"]
        }
    }
    Rectangle {
        width: 64
        height: 64
        color: Colors.surface0
        border.width: 2
        border.color: Colors.text
        Text {
            anchors.centerIn: parent
            color: Colors.text
            font.pixelSize: Fonts.size2
            font.family: Fonts.symbols
            horizontalAlignment: Text.AlignHCenter
            text: "󰗽"
        }
        MouseArea {
            id: logOut
            anchors.fill: parent
            hoverEnabled: true
            onClicked: logOutProc.running = true
        }
        Process {
            id: logOutProc
            command: ["systemctl", "terminate-user", "$USER"]
        }
    }
  }
}