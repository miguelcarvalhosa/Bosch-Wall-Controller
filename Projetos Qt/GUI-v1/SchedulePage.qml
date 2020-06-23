import QtQuick 2.4
import backend 1.0

SchedulePageForm {

    property int monStartH
    property int monStartM
    property int monStopH
    property int monStopM

    property int tueStartH
    property int tueStartM
    property int tueStopH
    property int tueStopM

    property int wedStartH
    property int wedStartM
    property int wedStopH
    property int wedStopM

    property int thuStartH
    property int thuStartM
    property int thuStopH
    property int thuStopM

    property int friStartH
    property int friStartM
    property int friStopH
    property int friStopM

    property int satStartH
    property int satStartM
    property int satStopH
    property int satStopM

    property int sunStartH
    property int sunStartM
    property int sunStopH
    property int sunStopM

    monSlider.first.onValueChanged: {
        monLabel.text = sliderTimeStr(monSlider.first.value, monSlider.second.value)
        monStartH = sliderTimeH(monSlider.first.value)
        monStartM = sliderTimeM(monSlider.first.value)
    }

    monSlider.second.onValueChanged: {
        monLabel.text = sliderTimeStr(monSlider.first.value, monSlider.second.value)
        monStopH = sliderTimeH(monSlider.second.value)
        monStopM = sliderTimeM(monSlider.second.value)
    }

    tueSlider.first.onValueChanged: {
        tueLabel.text = sliderTimeStr(tueSlider.first.value, tueSlider.second.value)
        tueStartH = sliderTimeH(tueSlider.first.value)
        tueStartM = sliderTimeM(tueSlider.first.value)
    }

    tueSlider.second.onValueChanged: {
        tueLabel.text = sliderTimeStr(tueSlider.first.value, tueSlider.second.value)
        tueStopH = sliderTimeH(tueSlider.second.value)
        tueStopM = sliderTimeM(tueSlider.second.value)
    }

    wedSlider.first.onValueChanged: {
        wedLabel.text = sliderTimeStr(wedSlider.first.value, wedSlider.second.value)
        wedStartH = sliderTimeH(wedSlider.first.value)
        wedStartM = sliderTimeM(wedSlider.first.value)
    }

    wedSlider.second.onValueChanged: {
        wedLabel.text = sliderTimeStr(wedSlider.first.value, wedSlider.second.value)
        wedStopH = sliderTimeH(wedSlider.second.value)
        wedStopM = sliderTimeM(wedSlider.second.value)
    }

    thuSlider.first.onValueChanged: {
        thuLabel.text = sliderTimeStr(thuSlider.first.value, thuSlider.second.value)
        thuStartH = sliderTimeH(thuSlider.first.value)
        thuStartM = sliderTimeM(thuSlider.first.value)
    }

    thuSlider.second.onValueChanged: {
        thuLabel.text = sliderTimeStr(thuSlider.first.value, thuSlider.second.value)
        thuStopH = sliderTimeH(thuSlider.second.value)
        thuStopM = sliderTimeM(thuSlider.second.value)
    }

    friSlider.first.onValueChanged: {
        friLabel.text = sliderTimeStr(friSlider.first.value, friSlider.second.value)
        friStartH = sliderTimeH(friSlider.first.value)
        friStartM = sliderTimeM(friSlider.first.value)
    }

    friSlider.second.onValueChanged: {
        friLabel.text = sliderTimeStr(friSlider.first.value, friSlider.second.value)
        friStopH = sliderTimeH(friSlider.second.value)
        friStopM = sliderTimeM(friSlider.second.value)
    }

    satSlider.first.onValueChanged: {
        satLabel.text = sliderTimeStr(satSlider.first.value, satSlider.second.value)
        satStartH = sliderTimeH(satSlider.first.value)
        satStartM = sliderTimeM(satSlider.first.value)
    }

    satSlider.second.onValueChanged: {
        satLabel.text = sliderTimeStr(satSlider.first.value, satSlider.second.value)
        satStopH = sliderTimeH(satSlider.second.value)
        satStopM = sliderTimeM(satSlider.second.value)
    }

    sunSlider.first.onValueChanged: {
        sunLabel.text = sliderTimeStr(sunSlider.first.value, sunSlider.second.value)
        sunStartH = sliderTimeH(sunSlider.first.value)
        sunStartM = sliderTimeM(sunSlider.first.value)
    }

    sunSlider.second.onValueChanged: {
        sunLabel.text = sliderTimeStr(sunSlider.first.value, sunSlider.second.value)
        sunStopH = sliderTimeH(sunSlider.second.value)
        sunStopM = sliderTimeM(sunSlider.second.value)
    }

    monSwitch.onToggled: {
        monSlider.enabled = !monSlider.enabled
        monBox.enabled = !monBox.enabled
    }

    tueSwitch.onToggled: {
        tueSlider.enabled = !tueSlider.enabled
        tueBox.enabled = !tueBox.enabled
    }

    wedSwitch.onToggled: {
        wedSlider.enabled = !wedSlider.enabled
        wedBox.enabled = !wedBox.enabled
    }

    thuSwitch.onToggled: {
        thuSlider.enabled = !thuSlider.enabled
        thuBox.enabled = !thuBox.enabled
    }

    friSwitch.onToggled: {
        friSlider.enabled = !friSlider.enabled
        friBox.enabled = !friBox.enabled
    }

    satSwitch.onToggled: {
        satSlider.enabled = !satSlider.enabled
        satBox.enabled = !satBox.enabled
    }

    sunSwitch.onToggled: {
        sunSlider.enabled = !sunSlider.enabled
        sunBox.enabled = !sunBox.enabled
    }

    monButton.onClicked: {
        BackEnd.schedule = [1, monSwitch.position, monBox.value, monStartH, monStartM, monStopH, monStopM]
    }

    tueButton.onClicked: {
        BackEnd.schedule = [2, tueSwitch.position, tueBox.value, tueStartH, tueStartM, tueStopH, tueStopM]
    }

    wedButton.onClicked: {
        BackEnd.schedule = [3, wedSwitch.position, wedBox.value, wedStartH, wedStartM, wedStopH, wedStopM]
    }

    thuButton.onClicked: {
        BackEnd.schedule = [4, thuSwitch.position, thuBox.value, thuStartH, thuStartM, thuStopH, thuStopM]
    }

    friButton.onClicked: {
        BackEnd.schedule = [5, friSwitch.position, friBox.value, friStartH, friStartM, friStopH, friStopM]
    }

    satButton.onClicked: {
        BackEnd.schedule = [6, satSwitch.position, satBox.value, satStartH, satStartM, satStopH, satStopM]
    }

    sunButton.onClicked: {
        BackEnd.schedule = [0, sunSwitch.position, sunBox.value, sunStartH, sunStartM, sunStopH, sunStopM]
    }


    function sliderTimeStr(first_value, second_value) {
        var first_value_hour = parseInt(first_value)
        var first_value_hour_str
        if(parseInt(first_value_hour) < 10) {
            first_value_hour_str = "0" + first_value_hour
        }
        else first_value_hour_str = first_value_hour
        var first_value_minute = parseInt((first_value - first_value_hour) * 60)
        var first_value_minute_str
        if(parseInt(first_value_minute) < 10) {
            first_value_minute_str = "0" + first_value_minute
        }
        else first_value_minute_str = first_value_minute

        var second_value_hour = parseInt(second_value)
        var second_value_hour_str
        if(parseInt(second_value_hour) < 10) {
            second_value_hour_str = "0" + second_value_hour
        }
        else second_value_hour_str = second_value_hour
        var second_value_minute = parseInt((second_value - second_value_hour) * 60)
        var second_value_minute_str
        if(parseInt(second_value_minute) < 10) {
            second_value_minute_str = "0" + second_value_minute
        }
        else second_value_minute_str = second_value_minute

        return first_value_hour_str + ":" + first_value_minute_str + " - " + second_value_hour_str + ":" + second_value_minute_str
    }

    function sliderTimeH(value) {
        return parseInt(value)
    }

    function sliderTimeM(value) {
        var value_hour = parseInt(value)
        return parseInt((value - value_hour) * 60)
    }

}
