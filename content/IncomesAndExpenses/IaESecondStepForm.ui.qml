import QtQuick 2.15
import QtQuick.Controls 2.15
import "../Utils"


/*
 Wizja układu jaki ma być

| --- KROK 1 --- | | --- KROK 2 --- | | --- KROK 3 --- |
    Konto i Kiedy    Dane transakcji    Kategoryzacja
                                        i guzik zapisz
 */
Rectangle {
    id: second_step_background
    width: 1920 * 0.3
    height: 1080 * 0.5

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

            width: parent.width

            Switch {
                id: income_switch
                width: parent.width * 0.3 - 10.0
                text: qsTr("Wpływ")
                font.pixelSize: 30
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
            height: second_step_background.height * 0.2

            placeholderText: qsTr("")
            color: "#000000"
            placeholderTextColor: "#000000"
        }
    }
}
