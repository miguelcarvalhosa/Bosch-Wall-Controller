import QtQuick 2.4
import QtQuick.VirtualKeyboard 2.1
import backend 1.0

SettingsPageForm {

    property var roomNames: BackEnd.roomNames
    property var roomIndex: BackEnd.roomIndex

    temperatureBox.onValueChanged: {
        BackEnd.changeUserTemperature = temperatureBox.value
    }

    newUserButton.onClicked: {
        BackEnd.settingsButtons = 1
    }

    sleepButton.onClicked: {
        BackEnd.settingsButtons = 2
    }

}
