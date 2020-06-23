import QtQuick 2.4
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0
import Qt3D.Input 2.1
import QtQuick.Layouts 1.0
import backend 1.0

Item {
    id: element
    width: 800
    height: 407
    property alias confirmButton: confirmButton
    property alias room2Slider: room2Slider
    property alias room5Slider: room5Slider
    property alias room5Switch: room5Switch
    property alias room4Slider: room4Slider
    property alias room4Switch: room4Switch
    property alias room3Slider: room3Slider
    property alias room3Switch: room3Switch
    property alias room2Switch: room2Switch
    property alias room1Slider: room1Slider
    property alias room1Switch: room1Switch

    visible: true

    Text {
        id: setTemperatureLabel
        x: 17
        width: 254
        height: 40
        text: qsTr("Set Temperature")
        font.family: "Arial"
        anchors.top: parent.top
        anchors.topMargin: 20
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: setTemperatureLayout.horizontalCenter
        Layout.preferredHeight: 25
        Layout.preferredWidth: 188
        font.pixelSize: 24
    }

    GridLayout {
        id: setTemperatureLayout
        columnSpacing: 5
        anchors.right: parent.right
        anchors.rightMargin: 360
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 90
        anchors.top: setTemperatureLabel.bottom
        anchors.topMargin: 10
        Layout.columnSpan: 2
        rows: 5
        columns: 3

        Switch {
            id: room1Switch
            width: 166
            text: roomNames[0]
            font.family: "Arial"
            display: AbstractButton.TextOnly
            font.pixelSize: 18
            Layout.columnSpan: 1
            Layout.preferredHeight: 33
            Layout.preferredWidth: 166
            checked: currTempSet[5]
        }

        Slider {
            id: room1Slider
            enabled: false
            Layout.preferredHeight: 33
            Layout.preferredWidth: 164
            value: currTempSet[0]
            from: 10
            to: 30
            stepSize: 0.5
        }

        Text {
            id: room1Temp
            text: room1Slider.value + qsTr("º")
            font.family: "Arial"
            Layout.preferredHeight: 20
            Layout.preferredWidth: 20
            font.pixelSize: 16
        }

        Switch {
            id: room2Switch
            text: roomNames[1]
            font.family: "Arial"
            font.pixelSize: 18
            Layout.columnSpan: 1
            Layout.preferredHeight: 33
            Layout.preferredWidth: 166
            checked: currTempSet[6]
        }

        Slider {
            id: room2Slider
            enabled: false
            Layout.preferredHeight: 33
            Layout.preferredWidth: 164
            value: currTempSet[1]
            from: 10
            to: 30
            stepSize: 0.5
        }

        Text {
            id: room2Temp
            text: room2Slider.value + qsTr("º")
            font.family: "Arial"
            Layout.preferredHeight: 19
            Layout.preferredWidth: 19
            font.pixelSize: 16
        }

        Switch {
            id: room3Switch
            text: roomNames[2]
            font.family: "Arial"
            font.pixelSize: 18
            Layout.columnSpan: 1
            Layout.preferredHeight: 33
            Layout.preferredWidth: 166
            checked: currTempSet[7]
        }

        Slider {
            id: room3Slider
            enabled: false
            Layout.preferredHeight: 33
            Layout.preferredWidth: 164
            value: currTempSet[2]
            from: 10
            to: 30
            stepSize: 0.5
        }

        Text {
            id: room3Temp
            text: room3Slider.value + qsTr("º")
            font.family: "Arial"
            Layout.preferredHeight: 18
            Layout.preferredWidth: 19
            font.pixelSize: 16
        }

        Switch {
            id: room4Switch
            text: roomNames[3]
            font.family: "Arial"
            font.pixelSize: 18
            Layout.columnSpan: 1
            Layout.preferredHeight: 33
            Layout.preferredWidth: 166
            checked: currTempSet[8]
        }

        Slider {
            id: room4Slider
            enabled: false
            Layout.preferredHeight: 33
            Layout.preferredWidth: 164
            value: currTempSet[3]
            from: 10
            to: 30
            stepSize: 0.5
        }

        Text {
            id: room4Temp
            text: room4Slider.value + qsTr("º")
            font.family: "Arial"
            Layout.preferredHeight: 17
            Layout.preferredWidth: 19
            font.pixelSize: 16
        }

        Switch {
            id: room5Switch
            text: roomNames[4]
            font.family: "Arial"
            font.pixelSize: 18
            Layout.preferredHeight: 33
            Layout.preferredWidth: 166
            checked: currTempSet[9]
        }

        Slider {
            id: room5Slider
            enabled: false
            Layout.preferredHeight: 33
            Layout.preferredWidth: 164
            value: currTempSet[4]
            from: 10
            to: 30
            stepSize: 0.5
        }

        Text {
            id: room5Temp
            text: room5Slider.value + qsTr("º")
            font.family: "Arial"
            Layout.preferredHeight: 20
            Layout.preferredWidth: 19
            font.pixelSize: 16
        }
    }

    Text {
        id: currentTemperatureLabel
        x: 420
        width: 347
        height: 40
        text: qsTr("Current Temperature")
        font.family: "Arial"
        anchors.horizontalCenter: currentTemperatureLayout.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 24
    }

    GridLayout {
        id: currentTemperatureLayout
        flow: GridLayout.LeftToRight
        anchors.left: parent.left
        anchors.leftMargin: 490
        anchors.right: parent.right
        anchors.rightMargin: 80
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 90
        anchors.top: currentTemperatureLabel.bottom
        anchors.topMargin: 10
        rows: 5
        columns: 2

        Text {
            id: room1Label
            text: roomNames[0]
            font.family: "Arial"
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 29
            Layout.preferredWidth: 114
            font.pixelSize: 18
        }

        Rectangle {
            id: rectangle1
            width: 65
            height: 25
            color: "#ffffff"
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.preferredHeight: 29
            Layout.preferredWidth: 70
            border.color: "black"

            Text {
                id: room1CurrTemp
                x: 0
                y: 0
                text: currTemp[0] + qsTr("º")
                font.family: "Arial"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredHeight: 29
                Layout.preferredWidth: 70
                anchors.centerIn: rectangle1
                font.pixelSize: 18
            }
        }

        Text {
            id: room2Label
            text: roomNames[1]
            font.family: "Arial"
            Layout.preferredWidth: 114
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 29
        }

        Rectangle {
            id: rectangle2
            width: 65
            height: 25
            color: "#ffffff"
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.preferredWidth: 70
            Layout.preferredHeight: 29
            border.color: "#000000"

            Text {
                id: room2CurrTemp
                x: 0
                y: -105
                text: currTemp[1] + qsTr("º")
                font.family: "Arial"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Layout.preferredWidth: 70
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.preferredHeight: 29
            }
        }

        Text {
            id: room3Label
            text: roomNames[2]
            font.family: "Arial"
            Layout.preferredWidth: 114
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 29
        }

        Rectangle {
            id: rectangle3
            width: 65
            height: 25
            color: "#ffffff"
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.preferredWidth: 70
            Layout.preferredHeight: 29
            border.color: "#000000"

            Text {
                id: room3CurrTemp
                x: -64
                y: -88
                text: currTemp[2] + qsTr("º")
                font.family: "Arial"
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.preferredWidth: 70
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredHeight: 29
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Text {
            id: room4Label
            text: roomNames[3]
            font.family: "Arial"
            Layout.preferredWidth: 114
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 29
        }

        Rectangle {
            id: rectangle4
            width: 65
            height: 25
            color: "#ffffff"
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            Text {
                id: room4CurrTemp
                x: -64
                y: -88
                text: currTemp[3] + qsTr("º")
                font.family: "Arial"
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.preferredWidth: 70
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.preferredHeight: 29
                anchors.verticalCenter: parent.verticalCenter
            }
            Layout.preferredWidth: 70
            Layout.preferredHeight: 29
            border.color: "#000000"
        }

        Text {
            id: room5Label
            text: roomNames[4]
            font.family: "Arial"
            Layout.preferredWidth: 114
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 29
        }

        Rectangle {
            id: rectangle5
            width: 65
            height: 25
            color: "#ffffff"
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            Text {
                id: room5CurrTemp
                x: -64
                y: -88
                text: currTemp[4] + qsTr("º")
                font.family: "Arial"
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.preferredWidth: 70
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredHeight: 29
                anchors.verticalCenter: parent.verticalCenter
            }
            Layout.preferredWidth: 70
            Layout.preferredHeight: 29
            border.color: "#000000"
        }
    }

    Button {
        id: confirmButton
        width: 200
        text: qsTr("Confirm Adjustment")
        focusPolicy: Qt.StrongFocus
        font.family: "Arial"
        font.capitalization: Font.MixedCase
        font.pointSize: 12
        display: AbstractButton.TextOnly
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: setTemperatureLayout.bottom
        anchors.topMargin: 20
    }
}
