import QtQuick 2.15
import QtQuick.Controls

RoundButton {
    property string t;
    MyText{
        id: buttonText
        text: t
        anchors.fill: parent
        font.pointSize: 17
        lineHeight: 0.8
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        color:"black"
    }

    background: Rectangle{
        id:bg
        anchors.fill: parent
        radius: 10
        border.width: 1
        border.color: "black"
        color: "white"
    }

    implicitHeight: gameAnswer.getHeight()
    implicitWidth: gameAnswer.getWidth()
    radius: 2
    display:AbstractButton.TextOnly

    onClicked:{
        if(!root.isClicked) return;
        root.isClicked = false
        if(buttonText.text == gameAnswer.getAnswer()){
            borderAnim.start()
            gameAnswer.pass = true
        }else{
            bg.border.color = "#FF4C4C"
            borderAnim.start()
            gameAnswer.pass = false
        }
    }

    NumberAnimation {
        id: borderAnim
        target: bg
        property: "border.width"
        from: 1
        to: 5
        duration: 120
    }

    Connections{
        target: gameAnswer
        onPassChanged:{
            if(gameAnswer.pass) return
            if(buttonText.text == gameAnswer.getAnswer()){
                bg.border.color = "#66FF66"
                borderAnim.start()
            }
        }
    }
}
