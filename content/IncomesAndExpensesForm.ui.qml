

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import "Utils"


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

    property alias comboBoxCategories: cb_category
    property alias comboBoxSubcategories: cb_subcategories

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

                Rectangle {
                    id: first_step_background
                    width: root.width * 0.3
                    height: root.height * 0.5
                    border.width: 3

                    Column {
                        id: first_step_column
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 10
                        anchors.topMargin: 10
                        spacing: 20

                        Text {
                            id: first_step_label
                            text: qsTr("Krok 1 - Wybierz konto i datę")
                            font.pixelSize: 32
                            fontSizeMode: Text.FixedSize
                        }

                        Row {
                            id: row_account
                            width: parent.width

                            Text {
                                id: label_account
                                width: parent.width * 0.2 - 10.0

                                text: qsTr("Konto")
                                font.pixelSize: 32
                                wrapMode: Text.NoWrap
                                minimumPixelSize: 30
                                fontSizeMode: Text.Fit
                            }

                            ComboBox {
                                id: cb_accounts
                                textRole: "Name"
                                valueRole: "ID"
                                model: DataBaseCursor.accounts
                                width: parent.width * 0.8 - 10.0
                            }
                        }

                        DatePicker {
                            id: date_picker_form
                            width: first_step_background.width - 20.0
                            height: first_step_background.height * 0.7
                        }
                    }
                }

                Rectangle {
                    id: second_step_background
                    width: root.width * 0.3
                    height: root.height * 0.5
                    border.width: 3

                    Column {
                        id: second_step_column
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 10
                        anchors.topMargin: 10
                        spacing: 20

                        Text {
                            id: second_step_label
                            text: qsTr("Krok 2 - Opisz transakcję")
                            font.pixelSize: 32
                            fontSizeMode: Text.FixedSize
                        }

                        Column {
                            id: column_payee
                            width: parent.width

                            Text {
                                id: label_payee
                                width: parent.width * 0.3 - 10.0
                                text: qsTr("Kontrahent")
                                font.pixelSize: 32
                                wrapMode: Text.NoWrap
                                minimumPixelSize: 30
                                fontSizeMode: Text.Fit
                            }

                            ComboBox {
                                id: cb_payees
                                textRole: "Name"
                                valueRole: "ID"
                                model: DataBaseCursor.payees
                                width: parent.width * 0.7 - 10.0
                            }
                        }

                        Row {
                            id: row_amount
                            width: parent.width

                            Text {
                                id: label_amount
                                width: parent.width * 0.3 - 10.0
                                height: 55
                                text: qsTr("Kwota")
                                font.pixelSize: 38
                                fontSizeMode: Text.FixedSize
                            }

                            TextField {
                                id: tf_amount
                                width: parent.width * 0.3
                                font.pixelSize: 30
                                placeholderText: qsTr("0,00")
                            }

                            Switch {
                                id: income_switch
                                width: parent.width * 0.3 - 10.0
                                text: qsTr("Wpływ")
                                font.pixelSize: 30
                            }
                        }

                        Text {
                            id: label_notes
                            text: qsTr("Notatki")
                            font.pixelSize: 32
                            fontSizeMode: Text.FixedSize
                        }

                        TextArea {
                            id: ta_notes

                            width: second_step_background.width - 20.0
                            height: second_step_background.height * 0.3

                            placeholderText: qsTr("")
                            color: "#000000"
                            placeholderTextColor: "#000000"
                        }
                    }
                }

                Rectangle {
                    id: third_step_background
                    width: root.width * 0.3
                    height: root.height * 0.5
                    border.width: 3

                    Column {
                        id: third_step_column
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 10
                        anchors.topMargin: 10
                        spacing: 20

                        Text {
                            id: third_step_label
                            width: parent.width

                            text: qsTr("Krok 3 - Skategoryzuj transakcję")
                            font.pixelSize: 32
                            wrapMode: Text.NoWrap
                            minimumPixelSize: 30
                            fontSizeMode: Text.Fit
                        }

                        Column {
                            id: column_member
                            width: parent.width - 20.0

                            Text {
                                id: label_member
                                text: qsTr("Centrum kosztów")
                                font.pixelSize: 32
                                fontSizeMode: Text.FixedSize
                            }

                            ComboBox {
                                id: cb_members
                                textRole: "Name"
                                valueRole: "ID"
                                model: DataBaseCursor.members
                                width: parent.width
                            }
                        }

                        Column {
                            id: column_category
                            width: parent.width - 20.0

                            Text {
                                id: label_category
                                text: qsTr("Kategoria")
                                font.pixelSize: 32
                                fontSizeMode: Text.FixedSize
                            }

                            ComboBox {
                                id: cb_category
                                textRole: "Name"
                                valueRole: "ID"
                                model: DataBaseCursor.categories

                                width: parent.width
                            }
                        }

                        Column {
                            id: column_subcategory
                            width: parent.width - 20.0

                            Text {
                                id: label_subcategory
                                text: qsTr("Podkategoria")
                                font.pixelSize: 32
                                fontSizeMode: Text.FixedSize
                            }

                            ComboBox {
                                id: cb_subcategories
                                textRole: "Name"
                                valueRole: "ID"

                                width: parent.width - 20.0
                            }
                        }

                        Button {
                            id: button_commit
                            text: qsTr("Zapisz")
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width * 0.8
                        }
                    }
                }
            }

            Text {
                id: help_placeholder
                text: qsTr("Najedź kursorem na dany element, aby zobaczyć podpowiedź.")
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
