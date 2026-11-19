import Quickshell.Hyprland
import Quickshell.Services.Pipewire
import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Controls
import "../../../themes"

Rectangle {
  anchors.fill: parent
  color: "transparent"
  property bool cursorOnButton
  property var defaultAudioSink: Pipewire.defaultAudioSink
  property var defaultAudioSource: Pipewire.defaultAudioSource
  property int volume: Math.round(defaultAudioSink.audio.volume * 100)
  property var sourceVolume: Math.round(defaultAudioSource.audio.volume * 100)
  cursorOnButton: sinkArea.containsMouse || sinkSlider.hovered || sourceSlider.hovered || sourceArea.containsMouse

  PwObjectTracker {
    objects: [defaultAudioSink, defaultAudioSource]
  }

  Rectangle {
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: parent.height / 2
    color: "transparent"
    Rectangle {
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.top: parent.top
      height: parent.height / 2
      color: "transparent"
      Rectangle { width: 32; height: 32
        id: sinkIcon
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 16
        radius: Ui.radius
        color: sinkArea.containsMouse ? Colors.accent0 : Colors.overlay0
        Text {
          anchors.centerIn: parent
          color: Colors.crust
          font.pixelSize: Fonts.size2
          font.family: Fonts.symbols
          text: defaultAudioSink.audio.muted ?"󰟎" : "󰋋"
        }
        MouseArea {
          id: sinkArea
          anchors.fill: parent
          hoverEnabled: true
          onClicked: defaultAudioSink.audio.muted = !defaultAudioSink.audio.muted
        }
      }
      Rectangle {
        anchors.left: sinkIcon.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.leftMargin: 16
        color: "transparent"
        Text {
          anchors.left: sinkIcon.right
          anchors.verticalCenter: parent.verticalCenter
          color: Colors.text
          font.pixelSize: Fonts.size2
          font.family: Fonts.text
          text: defaultAudioSink.nickname
        }
      }
    }
    Rectangle {
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      height: parent.height / 2
      color: "transparent"
      anchors.leftMargin: Ui.margins1
      anchors.rightMargin: Ui.margins1
      Slider { width: parent.width
        id: sinkSlider
        anchors.centerIn: parent
        from: 0; to: 150
        value: defaultAudioSink.audio.volume * 100
        stepSize: 10
        snapMode: Slider.SnapAlways
        onMoved: {
          defaultAudioSink.audio.volume = value / 100
        }
        background: Rectangle {
          x: sinkSlider.leftPadding
          y: sinkSlider.topPadding + sinkSlider.availableHeight / 2 - height / 2
          implicitHeight: 8
          width: sinkSlider.availableWidth
          height: implicitHeight
          radius: Ui.radius
          color: Colors.text
          Rectangle {
            width: sinkSlider.visualPosition * parent.width
            height: parent.height
            color: Colors.accent0
            radius: Ui.radius
          }
        }
        handle: Rectangle {
          x: sinkSlider.leftPadding + sinkSlider.visualPosition * (sinkSlider.availableWidth - width)
          y: sinkSlider.topPadding + sinkSlider.availableHeight / 2 - height / 2
          implicitWidth: 16
          implicitHeight: 32
          radius: 8
          color: Colors.accent0
          border.width: Ui.border
          border.color: Colors.crust
        }
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
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    height: parent.height / 2
    color: "transparent"
    Rectangle {
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.top: parent.top
      height: parent.height / 2
      color: "transparent"
      Rectangle { width: 32; height: 32
        id: sourceIcon
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 16
        radius: Ui.radius
        color: sourceArea.containsMouse ? Colors.accent0 : Colors.overlay0
        Text {
          anchors.centerIn: parent
          color: Colors.crust
          font.pixelSize: Fonts.size2
          font.family: Fonts.symbols
          text: defaultAudioSource.audio.muted ? "󰍭" : "󰍬"
        }
        MouseArea {
          id: sourceArea
          anchors.fill: parent
          hoverEnabled: true
          onClicked: defaultAudioSource.audio.muted = !defaultAudioSource.audio.muted
        }
      }
      Rectangle {
        anchors.left: sourceIcon.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.leftMargin: 16
        color: "transparent"
        Text {
          anchors.left: sinkIcon.right
          anchors.verticalCenter: parent.verticalCenter
          color: Colors.text
          font.pixelSize: Fonts.size2
          font.family: Fonts.text
          text: defaultAudioSource.nickname
        }
      }
    }
    Rectangle {
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      height: parent.height / 2
      color: "transparent"
      anchors.leftMargin: Ui.margins1
      anchors.rightMargin: Ui.margins1
      Slider { width: parent.width
        id: sourceSlider
        anchors.centerIn: parent
        from: 0; to: 200
        value: defaultAudioSource.audio.volume * 100
        stepSize: 10
        snapMode: Slider.SnapAlways
        onMoved: {
          defaultAudioSource.audio.volume = value / 100
        }
        background: Rectangle {
          x: sourceSlider.leftPadding
          y: sourceSlider.topPadding + sourceSlider.availableHeight / 2 - height / 2
          implicitHeight: 8
          width: sourceSlider.availableWidth
          height: implicitHeight
          radius: Ui.radius
          color: Colors.text
          Rectangle {
            width: sourceSlider.visualPosition * parent.width
            height: parent.height
            color: Colors.accent0
            radius: Ui.radius
          }
        }
        handle: Rectangle {
          x: sourceSlider.leftPadding + sourceSlider.visualPosition * (sourceSlider.availableWidth - width)
          y: sourceSlider.topPadding + sourceSlider.availableHeight / 2 - height / 2
          implicitWidth: 16
          implicitHeight: 32
          radius: 8
          color: Colors.accent0
          border.width: Ui.border
          border.color: Colors.crust
        }
      }
    }
  }
}