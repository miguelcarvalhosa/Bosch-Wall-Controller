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
            id: message1Text
            text: qsTr("Looks like you are not in the system")
            font.family: "Arial"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 28
        }

        Text {
            id: message2Text
            text: qsTr("Create new user?")
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
            id: yesButton
            width: 70
            text: qsTr("Yes")
            font.family: "Arial"
            font.pointSize: 12
            font.capitalization: Font.MixedCase
            anchors.left: parent.left
            anchors.leftMargin: 300
            anchors.verticalCenter: parent.verticalCenter
            onClicked: BackEnd.newUserButtons = 1
        }

        Button {
            id: noButton
            width: 70
            text: qsTr("No")
            font.family: "Arial"
            font.pointSize: 12
            font.capitalization: Font.MixedCase
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 300
            onClicked: BackEnd.newUserButtons = 2
        }
    }



}
