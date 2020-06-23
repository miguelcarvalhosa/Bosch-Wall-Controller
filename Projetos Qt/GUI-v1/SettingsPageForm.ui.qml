import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: element1
    width: 800
    height: 407
    property alias sleepButton: sleepButton
    property alias newUserButton: newUserButton
    property alias temperatureBox: temperatureBox

    Text {
        id: title
        text: qsTr("Wall Temperature Controller")
        font.family: "Arial"
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 31
    }

    Text {
        id: bosch
        x: -2
        y: 9
        text: qsTr("Bosch Termotecnologia")
        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        font.pixelSize: 26
        anchors.topMargin: 80
    }

    Text {
        id: element
        text: qsTr("Division name: ")
        font.family: "Arial"
        anchors.top: parent.top
        anchors.topMargin: 170
        anchors.left: parent.left
        anchors.leftMargin: 225
        font.pixelSize: 22
    }

    Text {
        id: roomName
        width: 200
        text: roomNames[roomIndex - 1]
        font.family: "Arial"
        horizontalAlignment: Text.AlignHCenter
        anchors.top: element.top
        anchors.topMargin: 0
        anchors.left: element.right
        anchors.leftMargin: 0
        font.pixelSize: 22
    }

    Text {
        id: element2
        x: -2
        y: 4
        text: qsTr("User desired temperature: ")
        font.family: "Arial"
        anchors.left: parent.left
        anchors.leftMargin: 198
        anchors.top: parent.top
        font.pixelSize: 21
        anchors.topMargin: 230
    }

    SpinBox {
        id: temperatureBox
        width: 150
        font.family: "Arial"
        value: 20
        to: 30
        from: 10
        font.pointSize: 14
        anchors.left: element2.right
        anchors.leftMargin: 0
        anchors.top: element2.top
        anchors.topMargin: -7
    }

    Button {
        id: newUserButton
        width: 165
        text: qsTr("Create New User")
        font.family: "Arial"
        font.pointSize: 13
        font.capitalization: Font.MixedCase
        anchors.left: parent.left
        anchors.leftMargin: 155
        anchors.top: parent.top
        anchors.topMargin: 300
    }

    Button {
        id: sleepButton
        x: 7
        y: -6
        width: 165
        text: qsTr("Standby mode")
        font.family: "Arial"
        font.pointSize: 13
        anchors.left: parent.left
        anchors.leftMargin: 480
        font.capitalization: Font.MixedCase
        anchors.top: parent.top
        anchors.topMargin: 300
    }
}

/*##^##
Designer {
    D{i:3;anchors_x:226;anchors_y:128}D{i:5;anchors_x:226;anchors_y:128}D{i:6;anchors_x:50;anchors_y:100}
}
##^##*/

