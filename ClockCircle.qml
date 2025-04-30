import QtQuick 2.15

Item {
    id: root
    width: 200
    height: 200
    visible: false

    property int time: 2
    property int remainingTime

    onVisibleChanged:{
        if(visible){
            remainingTime = time
            timer.running = true
        }
    }

    // 타이머
    Timer {
        id: timer
        interval: 1000
        running: false
        repeat: true

        onTriggered: {
            if (remainingTime <= 0) {
                timer.stop()
                gameAnswer.start()
                gameLoader.source = "GameBoard.qml"
                timerBarLoader.source = "TimerBar.qml"

                root.visible = false
            } else {
                if(remainingTime-1 <= 0) {
                    remainingTime = 0
                    return
                }

                remainingTime -= 1
            }
        }
    }

    // 원형 오브젝트
    Rectangle {
        width: 150
        height: 150
        radius: 75
        color: "black"
        anchors.centerIn: parent
    }

    // 남은 시간 표시
    MyText {
        id: remainingTimeText
        text: remainingTime
        font.pixelSize: 40
        color: "white"
        anchors.centerIn: parent
    }
}

