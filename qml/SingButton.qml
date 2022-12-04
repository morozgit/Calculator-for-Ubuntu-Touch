import QtQuick 2.0

Item {
    id: root
    property int size: units.gu(10)
    property color color: "black"
    property alias operation: singbutton_text.text

    signal clicked()

    width: size
    height: size

    function updatecolor()
    {
        return "#F7E425"
    }

    Rectangle
    {
        id:singbutton
        anchors.fill: parent
        radius: size/2
        color: mouseArea.containsPress ? updatecolor()  : root.color

        Text {
            id: singbutton_text
            anchors.centerIn: parent
            text: qsTr("&")
            color: "#FFFFFF"
            font.pointSize: units.gu(3)
        }
        MouseArea
        {
            id:mouseArea
            anchors.fill: parent
            onClicked: {python.call("example.speak",[singbutton_text.text],function (num){print(num)
            main_display_text.text = main_display_text.text + singbutton_text.text
            })}


        }


    }
}
