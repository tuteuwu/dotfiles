import Quickshell
import Quickshell.Io
import QtQuick
import "../../themes"

Rectangle {
  property var full_width
  anchors.verticalCenter: parent.verticalCenter
  anchors.right: parent.right
  width: full_width
  height: 32
  bottomLeftRadius: Ui.radius
  bottomRightRadius: Ui.radius
  color: Colors.base

  Process {
    id: dateProc
    command: ["date", "+%H:%M"]
    running: true
      stdout: StdioCollector {
      onStreamFinished: clock.text = this.text
    }
  }
  Text {
    id: clock
    anchors.centerIn: parent
    color: Colors.text
    font.pixelSize: Fonts.size2
    font.family: Fonts.text
    
    Timer {
      interval: 500
      running: true
      repeat: true
      onTriggered: dateProc.running = true
    }
  }
}
