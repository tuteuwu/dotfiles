import Quickshell
import QtQuick
import Quickshell.Io
import Quickshell.Services.UPower
import "../../themes"

Rectangle {
  anchors.fill: parent
  color: "transparent"
  Text {
    anchors.centerIn: parent
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