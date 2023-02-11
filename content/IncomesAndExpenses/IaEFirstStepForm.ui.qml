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

    id: first_step_background
    width: 1920 * 0.3
    height: 1080 * 0.5
    border.color: "#ffffff"

    property alias comboboxAccounts: cb_accounts
    property alias datePicker : date_picker

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
            id: date_picker
            width: first_step_background.width - 20.0
            height: first_step_background.height * 0.7
        }
    }
}
