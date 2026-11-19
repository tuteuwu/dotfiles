import Quickshell
import QtQuick
import Quickshell.Io
import Qt5Compat.GraphicalEffects
import Quickshell.Services.UPower
import "../../themes"

Rectangle {
  anchors.fill: parent
  color: "transparent"
  property var username
  Process {
    command: ["whoami"]
    running: true
    stdout: SplitParser {
      onRead: data => username = data.trim()
    }
  }
  Column {
    anchors.fill: parent
    Rectangle {
      anchors.horizontalCenter: parent.horizontalCenter
      width: parent.width/1.5
      height: parent.width/1.5
      color: "transparent"
      Rectangle {
        id: avatarMask
        anchors.fill: parent
        radius: parent.width / 2
      }
      Image {
        anchors.fill: parent
        source: "file:///home/" + username + "/.face"
        fillMode: Image.PreserveAspectCrop
        layer.enabled: true
        mipmap: true 
        smooth: true
        layer.effect: OpacityMask {
          maskSource: avatarMask
        }
      }
    }
    Text {
      anchors.bottom: parent.bottom
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottomMargin: Ui.margins1
      color: Colors.text
      font.pixelSize: Fonts.size2
      font.family: Fonts.text
      horizontalAlignment: Text.AlignHCenter
      text: ( UPower.displayDevice.percentage >= 0.97 ? "󰁹 " :
        UPower.displayDevice.percentage >= 0.90 ? "󰂂 " :
        UPower.displayDevice.percentage >= 0.80 ? "󰂁 " :
        UPower.displayDevice.percentage >= 0.70 ? "󰂀 " :
        UPower.displayDevice.percentage >= 0.60 ? "󰁿 " :
        UPower.displayDevice.percentage >= 0.50 ? "󰁾 " :
        UPower.displayDevice.percentage >= 0.40 ? "󰁽 " :
        UPower.displayDevice.percentage >= 0.30 ? "󰁼 " :
        UPower.displayDevice.percentage >= 0.20 ? "󰁻 " :
        UPower.displayDevice.percentage >= 0.10 ? "󰁺 " :
        UPower.displayDevice.percentage >= 0.01 ? "󰂃 " : "󰂄 " ) +
        (UPower.displayDevice.percentage*100).toFixed(2) + "%\n󱦟 " + (UPower.displayDevice.timeToEmpty/60).toFixed(2)
    }
  }
}