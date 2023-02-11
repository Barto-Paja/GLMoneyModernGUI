

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import "Utils"
import "IncomesAndExpenses"


/*
 Wizja układu jaki ma być

| --- KROK 1 --- | | --- KROK 2 --- | | --- KROK 3 --- |
    Konto i Kiedy    Dane transakcji    Kategoryzacja
                                        i guzik zapisz
 */
Item {
    id: root
    width: 1920
    height: 1080

    //    property alias comboBoxCategories: cb_category
    //    property alias comboBoxSubcategories: cb_subcategories
    //    property alias buttonCommit: button_commit
    property alias firstStep: first_step
    property alias secondStep: second_step
    property alias thirdStep: third_step
    property alias messageBox: msg

    Rectangle {
        id: root_background
        width: parent.width
        height: parent.height

        Column {
            id: root_column
            anchors.fill: parent
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            spacing: 50

            Rectangle {
                id: titleheader
                width: root.width
                color: "#ffffff"

                Row {
                    width: titleheader.width
                    height: titleheader.height

                    Text {
                        id: text1
                        width: root.width
                        text: qsTr("Notowanie wydatków")
                        font.pixelSize: 40
                    }
                }

                height: 50
            }

            Row {
                id: steps_row
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 3

                IaEFirstStep {
                    id: first_step
                    width: root.width * 0.3
                    height: root.height * 0.5
                    border.width: 3
                }

                IaESecondStep {
                    id: second_step
                    width: root.width * 0.3
                    height: root.height * 0.5
                    border.width: 3
                }

                IaEThirdStep {
                    id: third_step
                    width: root.width * 0.3
                    height: root.height * 0.5
                    border.width: 3
                }
            }

            MessageBox {
                id: msg
                visible: false
                anchors.horizontalCenter: parent.horizontalCenter
                message: "Jakiś tekst"
                width: parent.width*0.5
            }

            Text {
                id: help_placeholder
                text: qsTr("")
                font.pixelSize: 32
                wrapMode: Text.WordWrap
                minimumPixelSize: 30
                fontSizeMode: Text.Fit
            }

            Rectangle {
                id: headerseparator
                width: root.width
                height: 50
                color: "#ffffff"
            }
        }
    }
}
