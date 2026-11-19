import Quickshell
import Quickshell.Io
import qs.bar
import qs.menu

Scope {
  id: root

  property bool menuVisible: false

  IpcHandler {
    target: "menu"

    function toggle(): void {
      root.menuVisible = !root.menuVisible
    }

    function open(): void {
      root.menuVisible = true
    }

    function close(): void {
      root.menuVisible = false
    }
  }

  Variants {
    model: Quickshell.screens

    Bar {}
  }

  MainMenu {
    deployed: root.menuVisible
  }
}