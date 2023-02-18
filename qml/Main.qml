/*
 * Copyright (C) 2022  Your FullName
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * calculator is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import QtQuick.Window 2.2
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4


MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'calculator.arti'
    automaticOrientation: true

    width: Screen.primaryOrientation == 1 ? units.gu(51.5) : units.gu(99)
    height: Screen.primaryOrientation == 1 ? units.gu(99) : units.gu(51.5)

    backgroundColor: "#024873"


    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Calculator')


        }

        Item {
            id: display
            width: Screen.primaryOrientation == 1 ? units.gu(51.5) : units.gu(50)
            height: Screen.primaryOrientation == 1 ? units.gu(35) : units.gu(49)




            Rectangle{

                id: main_display
                anchors.fill: parent
                color: "#04BFAB"
                radius: units.gu(2)
                Label{
                    id:main_display_text
                    text: qsTr("")
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    anchors.bottomMargin: 5
                    font.pixelSize: units.gu(6)
                    color: "#FFFFFF"


                }
                Rectangle{
                    id:secondary_display
                    color: "red"
                    width: Screen.primaryOrientation == 1 ? units.gu(51.5) : units.gu(50)
                    height: Screen.primaryOrientation == 1 ? units.gu(19) : units.gu(35)

                    Label{
                        id:secondary_display_text1
                        text: qsTr("")
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        anchors.bottomMargin: 5
                        font.pixelSize: units.gu(6)
                        color: "#FFFFFF"
                    }
                    Label{
                        id:secondary_display_text2
                        text: qsTr("")
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        anchors.bottomMargin: units.gu(7)
                        font.pixelSize: units.gu(6)
                        color: "#FFFFFF"
                    }
                    Label{
                        id:secondary_display_text3
                        text: qsTr("")
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        anchors.bottomMargin: units.gu(13)
                        font.pixelSize: units.gu(6)
                        color: "#FFFFFF"
                    }

                }
            }
        }

        Item {
            width: units.gu(51.5)
            height: units.gu(35)

            Grid{

                id:numKeypad; x: Screen.orientation == 1 ? units.gu(2.5) : units.gu(52) ; y: Screen.orientation == 1 ? units.gu(37):units.gu(7);
                rowSpacing: Screen.orientation == 1 ? units.gu(1.5) : units.gu(1) ; columnSpacing: Screen.orientation == 1 ? units.gu(2.5) : units.gu(1.5);
                columns: Screen.orientation == 1 ? 4 : 5; rows: Screen.orientation == 1 ? 6 : 5


                    ClearButton {id:clear_button; operation: "AC"; color:"#F25E5E" }
                    DeleteButton { operation: "<-"; color:"#F25E5E" }
                    NumRoot { operation: "√‎"; color:"#0889A6" }
                    FactorialButton { operation: "n!"; color:"#0889A6" }
                    SingButton { operation: "√"; color:"#0889A6" }
                    SingButton { operation: "%"; color:"#0889A6" }
                    PowerButton { operation: "**"; color:"#0889A6" }
                    SingButton { operation: "/"; color:"#0889A6" }
                    CalcButton { operation: "7"; color:"#B0D1D8" }
                    CalcButton { operation: "8"; color:"#B0D1D8"}
                    CalcButton { operation: "9"; color:"#B0D1D8" }
                    SingButton { operation: "*"; color:"#0889A6" }
                    CalcButton { operation: "4"; color:"#B0D1D8" }
                    CalcButton { operation: "5"; color:"#B0D1D8" }
                    CalcButton { operation: "6"; color:"#B0D1D8" }
                    SingButton { operation: "+"; color:"#0889A6" }
                    CalcButton { operation: "1"; color:"#B0D1D8" }
                    CalcButton { operation: "2"; color:"#B0D1D8" }
                    CalcButton { operation: "3"; color:"#B0D1D8" }
                    SingButton { operation: "-"; color:"#0889A6" }
                    PlusMinusButton { operation: "+/-"; color:"#0889A6" }
                    CalcButton { operation: "0"; color:"#B0D1D8" }
                    CalcButton { operation: "."; color:"#B0D1D8" }
                    EqualButton { operation: "="; color:"#0889A6" }


            }
        }
    }


    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));
        importModule_sync("example")

        }

        onError: {
            console.log('python error: ' + traceback);
        }
    }
}
