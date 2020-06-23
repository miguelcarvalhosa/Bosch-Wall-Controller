import QtQuick 2.0
import QtQuick.Controls 2.12
import backend 1.0

Item {
    id: element
    width: 800
    height: 407

    Row {
        id: nameRow
        width: 800
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: nameText
            text: qsTr("Welcome " + BackEnd.welcomeUserName)
            font.family: "Arial"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 28
        }

        Text {
            id: setpointText
            text: qsTr("The temperature will be adjusted to " + BackEnd.welcomeTemperature + "ºC")
            font.family: "Arial"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 24
        }

    }

    Row {
        id: buttonRow
        x: 0
        y: 254
        width: 800
        height: 60
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 90

        Button {
            id: notmeButton
            width: 115
            text: qsTr("It's not me")
            font.family: "Arial"
            font.pointSize: 12
            font.capitalization: Font.MixedCase
            anchors.left: parent.left
            anchors.leftMargin: 250
            anchors.verticalCenter: parent.verticalCenter
            onClicked: BackEnd.welcomeButtons = 1
        }

        Button {
            id: closeButton
            width: 125
            text: qsTr("Do not adjust")
            font.family: "Arial"
            font.pointSize: 12
            font.capitalization: Font.MixedCase
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 250
            onClicked: BackEnd.welcomeButtons = 2
        }
    }

}

/*##^##
Designer {
    D{i:1;anchors_y:125}
}
##^##*/
