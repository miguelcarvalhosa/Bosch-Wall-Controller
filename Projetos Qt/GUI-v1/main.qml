import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import backend 1.0

ApplicationWindow {
    id: window
    visible: true
    visibility: Window.FullScreen
    width: 800
    height: 480
    property alias time: time
    title: qsTr("Bosch Temperature Controller")

    InputPanel {
        id: keyboard
        width: 800
        y: active ? parent.height - height : parent.height
        z: 10

    }

    function menuInt2Str(x) {
        if(x === 0) return "AdjustPage.qml"
        else if(x === 1) return "SchedulePage.qml"
        else if(x === 2) return "StatsPage.qml"
        else if(x === 3) return "SettingsPage.qml"
        else if(x === 4) return "WelcomePage.qml"
        else if(x === 5) return "NewUserPage.qml"
        else if(x === 6) return "AddUserPage.qml"
        else if(x === 7) return "SleepPage.qml"
        else return "AdjustPage.qml"
    }

    property date currentDate : new Date()
    property int currentMenuInt : BackEnd.currentMenu
    property var currentMenuStr: menuInt2Str(currentMenuInt)

    Connections {
        target: BackEnd
        onCurrentMenuChanged: {
            stackView.replace(currentMenuStr)
            if(currentMenuInt >= 0 && currentMenuInt <= 3) {
                tabBar.currentIndex = currentMenuInt
            }
        }
    }

    property var timerFlag: 0

    Timer {
        id: timer
        repeat: true
        interval: 1000
        running: true
        onTriggered: {
            currentDate = new Date()
            if(timerFlag === 1) {
                time.text = currentDate.toLocaleTimeString(Qt.locale("en_EN"), "h mm")
                timerFlag = 0
            }
            else {
                time.text = currentDate.toLocaleTimeString(Qt.locale("en_EN"), "h:mm")
                timerFlag = 1
            }
        }
    }

    Row {
        id: topBar
        height: 25
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0


        Image {
            id: image
            width: 800
            height: 25
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/topbar.png"
        }

        Label {
            id: date
            text: currentDate.toLocaleDateString(Qt.locale("en_EN"), "ddd, d MMM yyyy")
            font.family: "Arial"
            anchors.right: time.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        Label {
            id: time
            text: currentDate.toLocaleTimeString(Qt.locale("en_EN"), "h:mm")
            font.family: "Arial"
            anchors.right: parent.right
            anchors.rightMargin: 10
            leftPadding: 0
            anchors.verticalCenter: parent.verticalCenter
        }



    }

    TabBar {
        id: tabBar
        y: 96
        height: 0
        position: TabBar.Footer
        font.family: "Arial"
        //currentIndex: 1
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 48
        contentWidth: 0


        TabButton {
            id: adjustButton
            text: qsTr("Adjust")
            anchors.left: parent.left
            anchors.leftMargin: 0
            hoverEnabled: false
            display: AbstractButton.TextOnly
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -48
            onClicked: {
                BackEnd.currentMenu = 0
            }

        }

        TabButton {
            id: scheduleButton
            text: qsTr("Schedule")
            anchors.left: adjustButton.right
            anchors.leftMargin: 0
            hoverEnabled: false
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -48
            focusPolicy: Qt.StrongFocus
            checked: false
            display: AbstractButton.TextOnly
            onClicked: {
                BackEnd.currentMenu = 1
            }
        }


        TabButton {
            id: statsButton
            y: 9
            text: qsTr("Statistics")
            anchors.left: scheduleButton.right
            anchors.leftMargin: 0
            hoverEnabled: false
            display: AbstractButton.TextOnly
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -48
            onClicked: {
                BackEnd.currentMenu = 2
            }
        }

        TabButton {
            id: settingsButton
            y: 2
            text: qsTr("Settings")
            anchors.left: statsButton.right
            anchors.leftMargin: 0
            hoverEnabled: false
            display: AbstractButton.TextOnly
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -48
            onClicked: {
                BackEnd.currentMenu = 3
            }
        }
    }

    StackView {
        id: stackView
        anchors.topMargin: 0
        anchors.bottom: tabBar.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: topBar.bottom
        anchors.bottomMargin: 0
        initialItem: "SleepPage.qml"
    }






}




