import QtQuick 2.0
import QtQuick.Controls 2.12
import backend 1.0

Item {

    property var currTemp: BackEnd.currentTemperature
    property var roomIndex: BackEnd.roomIndex

    id: element
    width: 800
    height: 407

    Rectangle {
        id: rectangle
        x: 237
        z: 1
        width: 800
        height: 480
        color: "#000000"
        anchors.top: parent.top
        anchors.topMargin: -25
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: timeText
            color: "#fafafa"
            text: time.text
            font.family: "Arial"
            anchors.top: parent.top
            anchors.topMargin: 160
            font.bold: false
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 70
        }

        Text {
            id: temperatureText
            x: 0
            y: 4
            color: "#fafafa"
            text: currTemp[roomIndex-1] + " ºC"
            font.family: "Arial"
            font.bold: false
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35
            anchors.top: parent.top
            anchors.topMargin: 250
        }
    }

}

/*##^##
Designer {
    D{i:1;anchors_y:187;invisible:true}
}
##^##*/
