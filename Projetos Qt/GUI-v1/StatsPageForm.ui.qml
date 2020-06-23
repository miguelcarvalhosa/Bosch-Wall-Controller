import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.3

Item {
    id: element
    width: 800
    height: 407
    property alias yearButton: yearButton
    property alias monthButton: monthButton
    property alias yearPage: yearPage
    property alias monthPage: monthPage
    property alias weekPage: weekPage
    property alias dayPage: dayPage
    property alias weekButton: weekButton
    property alias stackView: stackView
    property alias dayButton: dayButton

    TabBar {
        id: tabBar
        height: 30
        font.family: "Arial"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        TabButton {
            id: dayButton
            text: qsTr("Today")
            font.pointSize: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
        }

        TabButton {
            id: weekButton
            x: -2
            y: -2
            text: qsTr("This Week")
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.top: parent.top
            font.pointSize: 10
            anchors.bottomMargin: 0
        }

        TabButton {
            id: monthButton
            x: -1
            y: 0
            text: qsTr("This Month")
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.top: parent.top
            font.pointSize: 10
            anchors.bottomMargin: 0
        }

        TabButton {
            id: yearButton
            x: 3
            y: 7
            text: qsTr("This Year")
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.top: parent.top
            font.pointSize: 10
            anchors.bottomMargin: 0
        }
    }

    StackView {
        id: stackView
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: tabBar.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        initialItem: dayPage

        Page {
            id: yearPage
            x: -7
            y: 30
            anchors.fill: parent

            ValueAxis {
                id: eixoX_year
                titleText: "Months"
                min: 1
                max: 12
                tickCount: 12
                labelFormat: "%d"
            }

            ValueAxis {
                id: eixoY_year
                titleText: "Temperature (ºC)"
            }

            ChartView {
                id: yearChart
                dropShadowEnabled: false
                backgroundColor: "#fafafa"
                anchors.fill: parent
                SplineSeries {
                    id: yearSeries
                    axisX: eixoX_year
                    axisY: eixoY_year
                    color: "#e91e63"
                }
            }
        }

        Page {
            id: monthPage
            x: -4
            y: 23
            anchors.fill: parent

            ValueAxis {
                id: eixoX_month
                titleText: "Days"
                min: 1
                max: 31
                tickCount: 31
                labelFormat: "%d"
            }

            ValueAxis {
                id: eixoY_month
                titleText: "Temperature (ºC)"
            }

            ChartView {
                id: monthChart
                dropShadowEnabled: false
                backgroundColor: "#fafafa"
                anchors.fill: parent
                SplineSeries {
                    id: monthSeries
                    axisX: eixoX_month
                    axisY: eixoY_month
                    color: "#e91e63"
                }
            }
        }

        Page {
            id: weekPage
            x: 0
            y: 30
            anchors.fill: parent

            ValueAxis {
                id: eixoX_week
                titleText: "Days"
                min: 1
                max: 7
                tickCount: 7
                labelFormat: "%d"
            }

            ValueAxis {
                id: eixoY_week
                titleText: "Temperature (ºC)"
            }

            ChartView {
                id: weekChart
                dropShadowEnabled: false
                backgroundColor: "#fafafa"
                anchors.fill: parent
                SplineSeries {
                    id: weekSeries
                    axisX: eixoX_week
                    axisY: eixoY_week
                    color: "#e91e63"
                }
            }
        }

        Page {
            id: dayPage
            anchors.fill: parent

            ValueAxis {
                id: eixoX_day
                titleText: "Hours"
                min: 0
                max: 24
                tickCount: 13
                labelFormat: "%d"
            }

            ValueAxis {
                id: eixoY_day
                titleText: "Temperature (ºC)"
            }

            ChartView {
                id: dayChart
                dropShadowEnabled: false
                backgroundColor: "#fafafa"
                anchors.fill: parent
                SplineSeries {
                    id: daySeries
                    axisX: eixoX_day
                    axisY: eixoY_day
                    color: "#e91e63"
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_width:100}D{i:6;anchors_height:200;anchors_width:200}
}
##^##*/

