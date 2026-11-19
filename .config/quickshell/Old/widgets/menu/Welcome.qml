import Quickshell
import QtQuick
import Quickshell.Io
import "../../themes"

Rectangle {
  anchors.fill: parent
  property var username
  property var distro
  property var kernel
  color: "transparent"
  Process {
    command: ["whoami"]
    running: true
    stdout: SplitParser {
      onRead: data => username = data.trim()
    }
  }
  Process {
    command: ["sh", "-c", "grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '\"'"]
    running: true
    stdout: SplitParser {
      onRead: data => distro = data.trim()
    }
  }
  Process {
    command: ["uname", "-r"]
    running: true
    stdout: SplitParser {
      onRead: data => kernel = data.trim()
    }
  }
  Rectangle { 
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.horizontalCenter: parent.horizontalCenter
    height: parent.height
    color: "transparent"
    Text {
      anchors.top: parent.top
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.topMargin: Ui.margins1
      color: Colors.text
      font.pixelSize: Fonts.size2
      font.family: Fonts.beauty
      horizontalAlignment: Text.AlignHCenter
      text: "Welcome Back!\n" + username
    }
    Text {
      anchors.bottom: parent.bottom
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottomMargin: Ui.margins1
      color: Colors.text
      font.pixelSize: Fonts.size1
      font.family: Fonts.text
      horizontalAlignment: Text.AlignHCenter
      text: "Currently on:\n " + distro + "\n(" + kernel + ")"
    }
  }
  
}