import QtQuick 2.0
import Ubuntu.Components 1.3
import QtQuick.Window 2.2

Item {
    id: root
    property int size: Screen.orientation == 1 ? units.gu(9) : units.gu(8)
    property color color: "black"
    property alias operation: power_button_text.text

    signal clicked()

    width: size
    height: size

    function updatecolor()
    {
        return "#F7E425"
    }

    Rectangle
    {
        id:power_button
        anchors.fill: parent
        radius: size/2
        color: mouseArea.containsPress ? updatecolor()  : root.color

        Text {
            id: power_button_text
            anchors.centerIn: parent
            text: qsTr("&")
            color: "#FFFFFF"
            font.pointSize: units.gu(3)
        }
        MouseArea
        {
            id:mouseArea
            anchors.fill: parent
            onClicked: python.call("example.Power", [main_display_text.text], function ( result )
            {
                console.log(power_button_text.text,main_display_text.text)
               //secondary_display_text.text = ""
               main_display_text.text = main_display_text.text + power_button_text.text
            })}


        }


}

