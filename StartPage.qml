import QtQuick 2.15

Item {
    id: root
    anchors.fill: parent

    MyText{
        y:10
        id: t
        color: "black"
        font.pointSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        text: "멋쟁이사자처럼\n" + "다른 글자 찾기"
    }

    onVisibleChanged:{
        if(visible == true){
            t.visible = true
            startButton.visible = true
        }
    }

    Image{
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/img.png"
        width: 300
        height: 300
        y:130
    }

    NextButton{
        id: startButton
        buttonText: "게임 시작하기"
        visible: true
        onClicked:{
            gameAnswer.reset()
            root.visible = false
            startTimer.visible = true
            textLoader.source = ""
            gameLoader.source = ""
            t.visible = false
        }
    }
}
