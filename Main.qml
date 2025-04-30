import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: mainWindow
    width: 430
    height: 600
    visible: true
    title: qsTr("멋쟁이사자처럼")

    StartPage{
        id: startPage
    }

    EndPage{
        id: endPage
        visible: false
    }

    NextButton{
        id: nextButton
        buttonText: "다음단계 도전하기"
        onClicked:{
            visible = false
            startTimer.visible = true
            textLoader.source = ""
            gameLoader.source = ""
        }
    }

    NextButton{
        id: returnButton
        buttonText: "시작화면으로 돌아가기"
        onClicked:{
            visible = false
            textLoader.source = ""
            gameLoader.source = ""
            startPage.visible = true
            gameAnswer.reset()
        }
    }

    ClockCircle{
        id: startTimer
        anchors.centerIn: parent
    }

    Loader{
        id: timerBarLoader
        y: 20
    }

    Loader{
        id: gameLoader
        x: 10
        y: 50
    }

    Loader{
        id: textLoader
        anchors.horizontalCenter: parent.horizontalCenter
        y:10
    }

    Connections{
        target: gameAnswer

        onPassChanged:{
            if(gameAnswer.pass == true){
                timerBarLoader.source = ""
                if(gameAnswer.stage == 5){
                    textLoader.source = "EndText.qml"
                }
                else{
                    textLoader.source = "PassText.qml"
                    nextButton.visible = true
                }
            }else{
                timerBarLoader.source = ""
                textLoader.source = "NonPassText.qml"
                returnButton.visible = true
            }
        }
    }
}
