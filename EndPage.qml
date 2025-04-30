import QtQuick 2.15
import QtQuick.Controls

Item {
    id: root
    anchors.fill: parent

    MyText {
        id: t
        color: "black"
        font.pointSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        text: "축하드립니다!!\n게임을 클리어하셨습니다!\n상품을 뽑아가세요:)"
    }

    onVisibleChanged:{
        if(visible == true){
            t.visible = true
            endButton.visible = true
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
        id: endButton
        buttonText: "처음화면으로 돌아가기"
        onClicked:{
            root.visible = false
            t.visible = false
            startPage.visible = true
        }
    }
}
