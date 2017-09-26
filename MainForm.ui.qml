import QtQuick 2.6
import QtQuick.Controls 1.4
import "PixelArtBoard.js" as PixelArtBoard


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
        columns: 2
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 15
        verticalItemAlignment: Grid.AlignVCenter
        TextEdit {
            id: sx
            text: qsTr("5")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: TextEdit.Center
            inputMethodHints: Qt.ImhDigitsOnly
            KeyNavigation.priority: KeyNavigation.BeforeItem
            Rectangle {
                anchors.fill: parent
                anchors.margins: -10
                anchors.rightMargin: 1
                color: "transparent"
                border.width: 1
            }
            width: 80
            onTextChanged: PixelArtBoard.updateGrid()
        }
        Button {
            id: clearbtn
            text: "Clear"
            onClicked: PixelArtBoard.cleanGrid()
        }

    }
    Rectangle{
        border.width: 1
        border.color:"black"
        width: parent.height -50
        height: parent.height -50
        y:50
        x: (parent.parent.width - width)/2
        Grid{
            id: grid
            width: parent.height
            height:parent.height
        }
        onWidthChanged: PixelArtBoard.updateGrid()
        onHeightChanged: PixelArtBoard.updateGrid()

    }
}
