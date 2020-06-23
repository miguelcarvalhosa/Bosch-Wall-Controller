import QtQuick 2.0
import QtQuick.Controls 2.12
import backend 1.0

Item {
    id: element
    width: 800
    height: 407

    Row {
        id: row
        width: 800
        height: 210
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: element1
            text: qsTr("Insert your name")
            font.family: "Arial"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 24
        }

        TextField {
            id: nameField
            width: 200
            font.family: "Arial"
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Your name")
        }

        Text {
            id: element2
            text: qsTr("Insert your desired temperature")
            font.family: "Arial"
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            anchors.top: parent.top
            anchors.topMargin: 120
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
        }

        SpinBox {
            id: temperatureInput
            font.family: "Arial"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            to: 30
            from: 10
            value: 22
            font.pointSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }

    Row {
        id: buttonRow
        x: 0
        width: 800
        height: 60
        anchors.top: row.bottom
        anchors.topMargin: 14

        Button {
            id: confirmButton
            width: 85
            text: qsTr("Confirm")
            font.family: "Arial"
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
            font.capitalization: Font.MixedCase
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                BackEnd.newUserName = nameField.text
                BackEnd.newUserTemperature = temperatureInput.value
                BackEnd.newUserButtons = 3
                busyIndicator.running = true;
            }
        }
    }

    BusyIndicator {
        id: busyIndicator
        x: 132
        anchors.top: buttonRow.bottom
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        running: false
    }



}


/*##^##
Designer {
    D{i:6;anchors_y:254}D{i:8;anchors_y:265}
}
##^##*/
