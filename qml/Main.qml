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

    width: units.gu(51.5)
    height: units.gu(99)
    backgroundColor: "#024873"

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Calculator')

        }

        Item {
            id: display
            width: units.gu(51.5)
            height: units.gu(35)

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
                    color: "#04BFAB"
                    width: units.gu(51.5)
                    height: units.gu(19)
                    Label{
                        id:secondary_display_text
                        text: qsTr("")
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        anchors.bottomMargin: 5
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
                id:numKeypad; x: units.gu(2.5); y:units.gu(40); spacing: units.gu(2); columns: 4; rows: 5

                ClearButton { operation: "AC"; color:"#F25E5E" }
                DeleteButton { operation: "<-"; color:"#F25E5E" }
                NumRoot { operation: "√"; color:"#0889A6" }
                PercentButton { operation: "%"; color:"#0889A6" }
                CalcButton { operation: "7"; color:"#B0D1D8" }
                CalcButton { operation: "8"; color:"#B0D1D8"}
                CalcButton { operation: "9"; color:"#B0D1D8" }
                SingButton { operation: "/"; color:"#0889A6" }
                CalcButton { operation: "4"; color:"#B0D1D8" }
                CalcButton { operation: "5"; color:"#B0D1D8" }
                CalcButton { operation: "6"; color:"#B0D1D8" }
                SingButton { operation: "*"; color:"#0889A6" }
                CalcButton { operation: "1"; color:"#B0D1D8" }
                CalcButton { operation: "2"; color:"#B0D1D8" }
                CalcButton { operation: "3"; color:"#B0D1D8" }
                SingButton { operation: "+"; color:"#0889A6" }
                CalcButton { operation: "0"; color:"#B0D1D8" }
                CalcButton { operation: "."; color:"#B0D1D8" }
                EqualButton { operation: "="; color:"#F25E5E" }
                SingButton { operation: "-"; color:"#0889A6" }
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
