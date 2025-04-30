import QtQuick 2.15
import QtQuick.Controls.Basic

Button{
    property string buttonText
    property color nowColor: hovered ? "#444444" : "black"
    width: parent.width-30
    visible: false
    height: 60
    y : 500
    anchors.horizontalCenter: parent.horizontalCenter
    display:AbstractButton.TextOnly

    background: Rectangle{
        anchors.fill: parent
        radius: 6
        color: parent.nowColor
    }

    MyText {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: parent.buttonText
        color: "white"
        font.pointSize: 20
    }


    Behavior on nowColor {
        ColorAnimation {
            duration: 150
        }
    }

}
