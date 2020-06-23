import QtQuick 2.4
import backend 1.0

AdjustPageForm {

    property var currTemp: BackEnd.currentTemperature
    property var currTempSet: BackEnd.currentTemperatureSet
    property var roomNames: BackEnd.roomNames

    room1Switch.onToggled: {
        room1Slider.enabled = !room1Slider.enabled
    }

    room2Switch.onToggled: {
        room2Slider.enabled = !room2Slider.enabled
    }


    room3Switch.onToggled: {
        room3Slider.enabled = !room3Slider.enabled
    }


    room4Switch.onToggled: {
        room4Slider.enabled = !room4Slider.enabled
    }


    room5Switch.onToggled: {
        room5Slider.enabled = !room5Slider.enabled
    }

    confirmButton.onClicked: {
        currTempSet = [room1Slider.value, room2Slider.value, room3Slider.value, room4Slider.value, room5Slider.value, room1Switch.position, room2Switch.position, room3Switch.position, room4Switch.position, room5Switch.position]
        BackEnd.currentTemperatureSet = currTempSet
    }


}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
