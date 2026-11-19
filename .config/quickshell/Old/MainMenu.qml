import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.Pipewire
import QtQuick
import Qt5Compat.GraphicalEffects
import Quickshell.Io
import QtQuick.Controls
import qs.widgets.menu
import qs.themes

PopupWindow {
  property var currentScreen
  property bool deployed
  anchor.window: topLevel
  anchor.rect.x: parentWindow.width / 2 - width / 2
  anchor.rect.y: 0
  implicitWidth: currentScreen.width / 4
  implicitHeight: currentScreen.height / 2
  visible: true
  color: "transparent"
  mask: Region { item: box }
  deployed: popupRoot.containsMouse || power.cursorOnButton || tabsMenu.cursorOnButton
  Rectangle {
    id: box
    anchors.top: parent
    anchors.horizontalCenter: parent.horizontalCenter
    width: deployed ? currentScreen.width / 4 : currentScreen.width / 16
    height: deployed ? currentScreen.height / 2 : 32
    radius: Ui.radius
    color: Colors.base
    MouseArea {
      id: popupRoot
      anchors.fill: parent
      hoverEnabled: true
    }
    Behavior on width { NumberAnimation {
      duration: Ui.animationSpeed0
      easing.type: Ui.animationEasing0
    } }
    Behavior on height { NumberAnimation {
      duration: Ui.animationSpeed2
      easing.type: Ui.animationEasing0
    } }
    Rectangle {
      id: topMargin
      anchors.top: parent
      anchors.left: parent.left
      anchors.right: parent.right
      height: 32
      color: "transparent"
    }
    Rectangle { // Top Menu
      id: topMenu
      anchors.top: topMargin.bottom
      anchors.left: parent.left
      anchors.right: parent.right
      height: deployed ? currentScreen.height / 6 : 1
      color: "transparent"
      Row {
        width: parent.width
        height: parent.height
        Rectangle { width: parent.width / 3; height: parent.height; visible: deployed; color: "transparent"
          Status { } }
        Rectangle { width: parent.width / 3; height: parent.height; visible: deployed; color: "transparent"
          Welcome { } }
        Rectangle { width: parent.width / 3; height: parent.height; visible: deployed; color: "transparent"
          Power { id: power }
        }
      }
      Rectangle { // Separation Bar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom
        width: parent.width - Ui.margins2; height: Ui.borderWidth
        visible: deployed; color: Colors.overlay0
      }
    }
    Rectangle {
      visible: deployed
      anchors.top: topMenu.bottom
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      anchors.topMargin: Ui.margins2
      color: "transparent"
      TabsMenu { id: tabsMenu}
    }
  }
}