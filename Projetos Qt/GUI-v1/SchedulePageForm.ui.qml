import QtQuick 2.4
import QtQuick.Controls 2.5
import backend 1.0

Item {

    id: page
    width: 800
    height: 407
    property alias sunButton: sunButton
    property alias satButton: satButton
    property alias friButton: friButton
    property alias thuButton: thuButton
    property alias wedButton: wedButton
    property alias tueButton: tueButton
    property alias monButton: monButton
    property alias sunBox: sunBox
    property alias satBox: satBox
    property alias friBox: friBox
    property alias thuBox: thuBox
    property alias wedBox: wedBox
    property alias tueBox: tueBox
    property alias monBox: monBox
    property alias sunSwitch: sunSwitch
    property alias satSwitch: satSwitch
    property alias friSwitch: friSwitch
    property alias thuSwitch: thuSwitch
    property alias wedSwitch: wedSwitch
    property alias tueSwitch: tueSwitch
    property alias monSwitch: monSwitch
    property alias tueLabel: tueLabel
    property alias wedLabel: wedLabel
    property alias thuLabel: thuLabel
    property alias friLabel: friLabel
    property alias satLabel: satLabel
    property alias sunLabel: sunLabel
    property alias sunSlider: sunSlider
    property alias satSlider: satSlider
    property alias friSlider: friSlider
    property alias thuSlider: thuSlider
    property alias wedSlider: wedSlider
    property alias tueSlider: tueSlider
    property alias monLabel: monLabel
    property alias monSlider: monSlider

    Row {
        id: row
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Label {
            id: title
            text: qsTr("Schedule Heating")
            anchors.top: parent.top
            anchors.topMargin: 10
            verticalAlignment: Text.AlignTop
            font.family: "Arial"
            font.bold: false
            font.italic: false
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Row {
        id: row1
        height: 22
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: row.bottom
        anchors.topMargin: 0

        Label {
            id: hoursLabel
            x: 103
            width: 420
            text: qsTr("00    02    04    06    08    10    12    14    16    18    20    22    24")
            font.wordSpacing: -1.2
            renderType: Text.QtRendering
            font.pointSize: 11
            font.family: "Arial"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 99
        }

        Label {
            id: timeLabel
            text: qsTr("Time")
            font.pointSize: 11
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 540
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
        }

        Label {
            id: temperatureLabel
            text: qsTr("ºC")
            font.family: "Arial"
            anchors.leftMargin: 660
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.left: parent.left
        }
    }

    Column {
        id: switchColumn
        width: 90
        spacing: 10
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: row1.bottom
        anchors.topMargin: 0

        Switch {
            id: monSwitch
            width: 90
            text: qsTr("Mon")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            enabled: true
            autoExclusive: false
            checked: false
            display: AbstractButton.TextOnly
        }

        Switch {
            id: tueSwitch
            width: 90
            text: qsTr("Tue")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: monSwitch.bottom
            anchors.topMargin: 0
            enabled: true
            display: AbstractButton.TextOnly
            checked: false
            autoExclusive: false
        }

        Switch {
            id: wedSwitch
            text: qsTr("Wed")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: tueSwitch.bottom
            anchors.topMargin: 0
            enabled: true
            display: AbstractButton.TextOnly
            checked: false
            autoExclusive: false
        }

        Switch {
            id: thuSwitch
            width: 90
            text: qsTr("Thu")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: wedSwitch.bottom
            anchors.topMargin: 0
            enabled: true
            display: AbstractButton.TextOnly
            checked: false
            autoExclusive: false
        }

        Switch {
            id: friSwitch
            width: 90
            text: qsTr("Fri")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: thuSwitch.bottom
            anchors.topMargin: 0
            enabled: true
            display: AbstractButton.TextOnly
            checked: false
            autoExclusive: false
        }

        Switch {
            id: satSwitch
            width: 90
            text: qsTr("Sat")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: friSwitch.bottom
            anchors.topMargin: 0
            enabled: true
            display: AbstractButton.TextOnly
            checked: false
            autoExclusive: false
        }

        Switch {
            id: sunSwitch
            width: 90
            text: qsTr("Sun")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: satSwitch.bottom
            anchors.topMargin: 0
            enabled: true
            display: AbstractButton.TextOnly
            checked: false
            autoExclusive: false
        }
    }

    Column {
        id: sliderColumn
        width: 410
        anchors.left: switchColumn.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: row1.bottom
        anchors.topMargin: 0

        RangeSlider {
            id: monSlider
            width: 410
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            enabled: true
            orientation: RangeSlider.SnapAlways
            live: true
            stepSize: 1
            to: 24
            second.value: 12
            first.value: 0
        }

        RangeSlider {
            id: tueSlider
            width: 410
            anchors.top: monSlider.bottom
            anchors.topMargin: 0
            enabled: true
            anchors.verticalCenter: tueSwitch.verticalCenter
            anchors.right: tueLabel.left
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 0
            live: true
            orientation: RangeSlider.SnapAlways
            to: 24
            stepSize: 0.5
            second.value: 12
            first.value: 0
        }

        RangeSlider {
            id: wedSlider
            width: 410
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: tueSlider.bottom
            anchors.topMargin: 0
            enabled: true
            live: true
            orientation: RangeSlider.SnapAlways
            to: 24
            stepSize: 0.5
            second.value: 12
            first.value: 0
        }

        RangeSlider {
            id: thuSlider
            width: 410
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: wedSlider.bottom
            anchors.topMargin: 0
            enabled: true
            live: true
            orientation: RangeSlider.SnapAlways
            to: 24
            stepSize: 0.5
            second.value: 12
            first.value: 0
        }

        RangeSlider {
            id: friSlider
            width: 410
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: thuSlider.bottom
            anchors.topMargin: 0
            enabled: true
            live: true
            orientation: RangeSlider.SnapAlways
            to: 24
            stepSize: 0.5
            second.value: 12
            first.value: 0
        }

        RangeSlider {
            id: satSlider
            width: 410
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: friSlider.bottom
            anchors.topMargin: 0
            enabled: true
            live: true
            orientation: RangeSlider.SnapAlways
            to: 24
            stepSize: 0.5
            second.value: 12
            first.value: 0
        }

        RangeSlider {
            id: sunSlider
            width: 410
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: satSlider.bottom
            anchors.topMargin: 0
            enabled: true
            live: true
            orientation: RangeSlider.SnapAlways
            to: 24
            stepSize: 0.5
            second.value: 12
            first.value: 0
        }
    }

    Column {
        id: labelColumn
        width: 87
        anchors.left: sliderColumn.right
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: row1.bottom
        anchors.topMargin: 0

        Label {
            id: monLabel
            height: 48
            text: qsTr("00:00 - 00:00")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: tueLabel
            height: 48
            text: qsTr("00:00 - 00:00")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: monLabel.bottom
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: wedLabel
            height: 48
            text: qsTr("00:00 - 00:00")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: tueLabel.bottom
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: thuLabel
            height: 48
            text: qsTr("00:00 - 00:00")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: wedLabel.bottom
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: friLabel
            height: 48
            text: qsTr("00:00 - 00:00")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: thuLabel.bottom
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: satLabel
            height: 48
            text: qsTr("00:00 - 00:00")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: friLabel.bottom
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: sunLabel
            height: 48
            text: qsTr("00:00 - 00:00")
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: satLabel.bottom
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
        }
    }

    Column {
        id: boxColumn
        width: 130
        anchors.left: labelColumn.right
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: row1.bottom
        anchors.topMargin: 0

        SpinBox {
            id: monBox
            width: 120
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            enabled: true
            editable: false
            to: 30
            from: 10
            value: 20
        }

        SpinBox {
            id: tueBox
            width: 120
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: monBox.bottom
            anchors.topMargin: 0
            enabled: true
            value: 20
            to: 30
            editable: false
            from: 10
        }

        SpinBox {
            id: wedBox
            width: 120
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: tueBox.bottom
            anchors.topMargin: 0
            enabled: true
            value: 20
            to: 30
            editable: false
            from: 10
        }

        SpinBox {
            id: thuBox
            width: 120
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: wedBox.bottom
            anchors.topMargin: 0
            enabled: true
            value: 20
            to: 30
            editable: false
            from: 10
        }

        SpinBox {
            id: friBox
            width: 120
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: thuBox.bottom
            anchors.topMargin: 0
            enabled: true
            value: 20
            to: 30
            editable: false
            from: 10
        }

        SpinBox {
            id: satBox
            width: 120
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: friBox.bottom
            anchors.topMargin: 0
            enabled: true
            value: 20
            to: 30
            editable: false
            from: 10
        }

        SpinBox {
            id: sunBox
            width: 120
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: satBox.bottom
            anchors.topMargin: 0
            enabled: true
            value: 20
            to: 30
            editable: false
            from: 10
        }
    }

    Column {
        id: buttonColumn
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: boxColumn.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: row1.bottom
        anchors.topMargin: 0

        Button {
            id: monButton
            width: 48
            text: qsTr("Set")
            highlighted: false
            font.family: "Arial"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
        }

        Button {
            id: tueButton
            width: 48
            text: qsTr("Set")
            font.family: "Arial"
            anchors.top: monButton.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.left: parent.left
        }

        Button {
            id: wedButton
            width: 48
            text: qsTr("Set")
            font.family: "Arial"
            anchors.top: tueButton.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.left: parent.left
        }

        Button {
            id: thuButton
            width: 48
            text: qsTr("Set")
            font.family: "Arial"
            anchors.top: wedButton.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.left: parent.left
        }

        Button {
            id: friButton
            width: 48
            text: qsTr("Set")
            font.family: "Arial"
            anchors.top: thuButton.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.left: parent.left
        }

        Button {
            id: satButton
            width: 48
            text: qsTr("Set")
            font.family: "Arial"
            anchors.top: friButton.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.left: parent.left
        }

        Button {
            id: sunButton
            width: 48
            text: qsTr("Set")
            font.family: "Arial"
            anchors.top: satButton.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.left: parent.left
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_width:50}D{i:3;anchors_width:200}D{i:7;anchors_height:400}D{i:15;anchors_height:400;anchors_x:437;anchors_y:122}
D{i:23;anchors_height:400}D{i:31;anchors_height:400;anchors_x:391;anchors_y:230}D{i:39;anchors_height:400;anchors_width:200}
}
##^##*/

