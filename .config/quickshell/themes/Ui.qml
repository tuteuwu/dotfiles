pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick


Singleton {
  property int radius: 0

  property int borderWidth: 2

  property int margins0: 4
  property int margins1: 8
  property int margins2: 16


  property int animationSpeed0: 100
  property int animationSpeed1: 250
  property int animationSpeed3: 500
  property var animationEasing0: Easing.OutCirc
  property var animationEasing1: Easing.OutCirc
}