import QtQuick 2.15
import QtQuick.Layouts

Item{
    id: root
    property bool isClicked: true
    Column{
        spacing: 10
        Repeater{
            model: gameAnswer.stage
            Row{
                spacing: 10
                id: row
                required property int index;
                Repeater{
                    model: gameAnswer.stage
                    GameButton{
                        required property int index
                        t: gameAnswer.getData(row.index * gameAnswer.stage + index);
                    }
                }
            }
        }
    }

    Connections{
        target: gameAnswer;
        onPassChanged:{
            isClicked = false
        }
    }
}
