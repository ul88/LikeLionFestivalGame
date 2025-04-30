import QtQuick 2.15

MyText {
    color: "black"
    font.pointSize: 18

    text: "클리어!!"

    Timer{
        interval: 2500
        running: true
        onTriggered:{
            endPage.visible = true
            gameLoader.source = ""
            textLoader.source = ""
        }
    }
}
