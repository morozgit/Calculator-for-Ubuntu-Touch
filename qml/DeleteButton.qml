import QtQuick 2.0
import Ubuntu.Components 1.3

Item {
    id: root
    property int size: units.gu(10)
    property color color: "black"
    property alias operation: delete_button_text.text

    signal clicked()

    width: size
    height: size

    function updatecolor()
    {
        return "#F7E425"
    }

    Rectangle
    {
        id:delete_button
        anchors.fill: parent
        radius: size/2
        color: mouseArea.containsPress ? updatecolor()  : root.color

        Text {
            id: delete_button_text
            anchors.centerIn: parent
            text: qsTr("&")
            color: "#FFFFFF"
            font.pointSize: units.gu(3)
        }
        MouseArea
        {
            id:mouseArea
            anchors.fill: parent
            onClicked: python.call("example.delete", [main_display_text.text], function ( result )
            {
                print(result)
               //secondary_display_text.text = ""
               main_display_text.text = result
            })}


        }


}

