import QtQuick 2.15

Item {
    id: root
    property int second
    width: 430
    height: 15

    Component.onCompleted:{
        switch(gameAnswer.stage){
        case 2:
            second = 7000
            break
        case 3:
            second = 6000
            break
        case 4:
            second = 4800
            break
        case 5:
            second = 3500
            break
        }
        xanimator.start()
    }

    Rectangle{
        anchors.fill: parent
        color: "lightgrey"
        radius: 3
        border.color: "black"
        border.width: 2
    }
    Rectangle{
        id: bar
        anchors.fill: parent
        implicitWidth: 30
        color: "black"
        radius: 3

        XAnimator {
            id: xanimator
            target: bar;
            from: 0;
            to: -430;
            duration: second

            onRunningChanged:{
                if(!running){
                    gameAnswer.pass = false
                }
            }
        }
    }
}
