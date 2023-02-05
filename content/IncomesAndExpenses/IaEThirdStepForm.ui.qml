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
    id: third_step_background
    width: 1920 * 0.3
    height: 1080 * 0.5

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
