import QtQuick 2.0
import Ubuntu.Components 1.3
import QtQuick.Window 2.2


Item {
    id:root
    property int size: Screen.orientation == 1 ? units.gu(9) : units.gu(8)
    property color color: "black"
    property alias text: button_text.text
    property alias  operation: button_text.text

    signal clicked

    width: size
    height: size
    focus: true

    function updateColor()
    {
        return "#04BFAD"
    }

    Rectangle{
        id:button
        anchors.fill: parent
        radius: size/2
        color: mouseArea.containsPress ? updateColor() : root.color

        Text {
            id: button_text
            anchors.centerIn: parent
            text: qsTr("")
            color: mouseArea.containsPress ? "#FFFFFF" : "#024873"
            font.pointSize: units.gu(3)
        }

    }
    MouseArea
    {
        id:mouseArea
        anchors.fill: parent
        onClicked: {python.call("example.calcbutton",[button_text.text],function (num){
                    print(num)

                    main_display_text.text = main_display_text.text + button_text.text

        })}
    }
}
