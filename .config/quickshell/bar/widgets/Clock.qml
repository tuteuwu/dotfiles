import Quickshell
import Quickshell.Io
import QtQuick
import "../../themes"

Rectangle {
  anchors.centerIn: parent
  color: "Transparent"

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
