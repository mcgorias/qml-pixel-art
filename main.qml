import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Pixel Art Pictionary")
   // visibility: Window.FullScreen
    MainForm {
        anchors.fill: parent

      //  mouseArea.onClicked: {
      //      console.log(qsTr('Clicked on background.'))
      //  }

    }
}
