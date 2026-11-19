import Quickshell
import QtQuick
import Quickshell.Services.SystemTray
import "../../themes"
Rectangle {
	id: trayRoot
	anchors.fill: parent
	color: "Transparent"

	Row {
		id: trayRow
		anchors.verticalCenter: parent.verticalCenter
		anchors.right: parent.right
		spacing: Ui.margins0
		Repeater {
			model: SystemTray.items
			delegate: Image {
				source: modelData.icon
				height: 24
				width: 24
				fillMode: Image.PreserveAspectFit
				mipmap: true
				smooth: true
				MouseArea {
					anchors.fill: parent
					onClicked: function(mouse) {
            			if (mouse.button === Qt.LeftButton)
              				modelData.activate()
            			else
              				modelData.secondaryActivate()
          				}
				}
			}
		}
	}
}

