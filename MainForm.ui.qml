import QtQuick 2.6
import QtQuick.Controls 1.4
import "PixelArtBoard.js" as PixelArtBoard
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2
import QtQml 2.2

Rectangle {
    property alias mouseArea: mouseArea
    property alias sizeX: sx
    property alias grid: grid

    width: 360
    height: 360

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Grid{
        id: menubar
        columns: 3
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 15
        verticalItemAlignment: Grid.AlignVCenter
        height: 25
        TextEdit {
            id: sx
            text: qsTr("25")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: TextEdit.Center
            inputMethodHints: Qt.ImhDigitsOnly
            KeyNavigation.priority: KeyNavigation.BeforeItem
            height: parent.height
            width: 100
            font.pixelSize: this.height

            Rectangle {
                anchors.fill: parent
                anchors.margins: -10
                anchors.rightMargin: 1
                color: "transparent"
                border.width: 1
            }

            onTextChanged: PixelArtBoard.updateGrid();
        }
        MenuButton{
            id: timerBtn
            Timer {
                property var timeToPlay: 60;

                interval: 1000;
                running: true ;
                repeat: true
                onTriggered: timerBtn.text = timeToPlay--;
                }
        }
        MenuButton {
            id: clearbtn
            text: "Clear"
            onClicked: PixelArtBoard.cleanGrid();
        }

    }
    Rectangle{
        border.width: 1
        border.color:"black"
        property var sideSize : Math.min(parent.height -50,  parent.height - 50 - menubar.height)
        width:  sideSize -5
        height: sideSize -5
        y: Window.height - height-5
        x:(parent.parent.width - width)/2
        Grid{
            id: grid
            width: parent.height
            height:parent.height
        }
        onWidthChanged: PixelArtBoard.updateGrid()
        onHeightChanged: PixelArtBoard.updateGrid()

    }
}
