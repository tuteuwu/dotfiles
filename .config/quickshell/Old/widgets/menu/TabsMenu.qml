import Quickshell
import QtQuick
import Qt5Compat.GraphicalEffects
import "../../themes"
import "./tabs"


Rectangle {
  anchors.fill: parent
  property bool cursorOnButton
  property bool showMenu0: true
  property bool showMenu1
  property bool showMenu2
  color: "transparent"
  cursorOnButton: menu0.containsMouse || menu1.containsMouse || menu2.containsMouse || volumen.cursorOnButton
  Row {
    id: tabs
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width - Ui.margins2 * 2
    height: 32
    Rectangle {
      width: showMenu0 ? parent.width / 2 : parent.width / 4
      height: 32
      color: Colors.surface0
      bottomLeftRadius: showMenu0 ? 0 : Ui.radius
      bottomRightRadius: showMenu0 ? 0 : Ui.radius
      topLeftRadius: Ui.radius
      topRightRadius: Ui.radius
      MouseArea {
        id: menu0
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
          showMenu0 = true;
          showMenu1 = false;
          showMenu2 = false;
        }
      }
      Text {
        anchors.fill: parent
        color: showMenu0 ? Colors.accent0 : Colors.text
        font.pixelSize: Fonts.size2
        font.family: Fonts.text
        horizontalAlignment: Text.AlignHCenter
        text: showMenu0 ? " Audio" : ""
      }
      Behavior on width { NumberAnimation {
        duration: Ui.animationSpeed2
        easing.type: Ui.animationEasing0
      } }
      Behavior on bottomLeftRadius { NumberAnimation {
        duration: Ui.animationSpeed2
        easing.type: Ui.animationEasing0
      } }
      Behavior on bottomRightRadius { NumberAnimation {
        duration: Ui.animationSpeed2
        easing.type: Ui.animationEasing0
      } }
    }
    Rectangle {
      width: showMenu1 ? parent.width / 2 : parent.width / 4
      height: 32
      color: Colors.surface0
      bottomLeftRadius: showMenu1 ? 0 : Ui.radius
      bottomRightRadius: showMenu1 ? 0 : Ui.radius
      topLeftRadius: Ui.radius
      topRightRadius: Ui.radius
      MouseArea {
        id: menu1
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
          showMenu0 = false;
          showMenu1 = true;
          showMenu2 = false;
        }
      }
      Text {
        anchors.fill: parent
        color: showMenu1 ? Colors.accent0 : Colors.text
        font.pixelSize: Fonts.size2
        font.family: Fonts.text
        horizontalAlignment: Text.AlignHCenter
        text: showMenu1 ? "󰍜 Media" : "󰍜"
      }
      Behavior on width { NumberAnimation {
        duration: Ui.animationSpeed2
        easing.type: Ui.animationEasing0
      } }
      Behavior on bottomLeftRadius { NumberAnimation {
        duration: Ui.animationSpeed2
        easing.type: Ui.animationEasing0
      } }
      Behavior on bottomRightRadius { NumberAnimation {
        duration: Ui.animationSpeed2
        easing.type: Ui.animationEasing0
      } }
    }
    Rectangle {
      width: showMenu2 ? parent.width / 2 : parent.width / 4
      height: 32
      color: Colors.surface0
      bottomLeftRadius: showMenu2 ? 0 : Ui.radius
      bottomRightRadius: showMenu2 ? 0 : Ui.radius
      topLeftRadius: Ui.radius
      topRightRadius: Ui.radius
      MouseArea {
        id: menu2
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
          showMenu0 = false;
          showMenu1 = false;
          showMenu2 = true;
        }
      }
      Text {
        anchors.fill: parent
        color: showMenu2 ? Colors.accent0 : Colors.text
        font.pixelSize: Fonts.size2
        font.family: Fonts.text
        horizontalAlignment: Text.AlignHCenter
        text: showMenu2 ? " Performance" : ""
      }
      Behavior on width { NumberAnimation {
        duration: Ui.animationSpeed2
        easing.type: Ui.animationEasing0
      } }
      Behavior on bottomLeftRadius { NumberAnimation {
        duration: Ui.animationSpeed2
        easing.type: Ui.animationEasing0
      } }
      Behavior on bottomRightRadius { NumberAnimation {
        duration: Ui.animationSpeed2
        easing.type: Ui.animationEasing0
      } }
    }
  }
  Rectangle {
    anchors.top: tabs.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    height: parent.height - 32 - Ui.margins2
    width: parent.width - Ui.margins2 * 2
    bottomLeftRadius: Ui.radius
    bottomRightRadius: Ui.radius
    topLeftRadius: showMenu0 ? 0 : Ui.radius
    topRightRadius: showMenu2 ? 0 : Ui.radius
    color: Colors.surface0
    Volumen { id: volumen; visible: showMenu0}

    Behavior on bottomLeftRadius { NumberAnimation {
      duration: Ui.animationSpeed2
      easing.type: Ui.animationEasing0
    } }
    Behavior on bottomRightRadius { NumberAnimation {
      duration: Ui.animationSpeed2
      easing.type: Ui.animationEasing0
    } }
  }
}