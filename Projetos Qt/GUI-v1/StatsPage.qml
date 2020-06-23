import QtQuick 2.4

StatsPageForm {

    dayButton.onClicked: {
        stackView.replace(dayPage)
    }
    weekButton.onClicked: {
        stackView.replace(weekPage)
    }
    monthButton.onClicked: {
        stackView.replace(monthPage)
    }
    yearButton.onClicked: {
        stackView.replace(yearPage)
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
