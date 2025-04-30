import QtQuick 2.15


MyText {
    color: "black"
    font.pointSize: 18

    text: (gameAnswer.stage-1) + "단계 성공!"

    Timer{
        interval: 3000
        running: true
        onTriggered:{
            parent.text = "다음 단계를 도전해보세요!"
        }
    }
}
