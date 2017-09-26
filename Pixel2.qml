import QtQuick 2.0

Rectangle {
    property var pixstate :false

    border.width: 1
    border.color: "gray"
    function changeState(state)
    {
        pixstate=state;
        color = pixstate ? "black" : "white";
    }
    MouseArea {
       //hoverEnabled: true
       anchors.fill: parent
       width: parent.width
       height: parent.height
       onClicked: {
            changeState(!pixstate);
       }
    }
}
