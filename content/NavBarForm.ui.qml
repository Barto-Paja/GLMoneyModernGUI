

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1024
    height: 768

    Rectangle {

        width: root.width
        height: root.height

        border.width: 0
        gradient: Gradient {

            GradientStop {
                position: 0
                color: "#c2e9fb"
            }

            GradientStop {
                position: 1
                color: "#ffffff"
            }

            orientation: Gradient.Horizontal
        }

        Column {
            id: column
            width: root.width
            height: root.height
            spacing: 5

            // Notowanie wydatków i przychodów
            Rectangle {
                id: incomes_and_expences_header
                width: root.width
                height: 50
                color: "#00ffffff"

                Text {
                    id: iaeh_text
                    text: qsTr("Notawanie")
                    font.pixelSize: 24
                }
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Dodaj nowy wpis")
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Podgląd transakcji")
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Importuj transakcje z CSV")
            }

            // Narzędzia do zarządzania
            Rectangle {
                id: tools_header
                width: root.width
                height: 50
                color: "#00ffffff"

                Text {
                    id: tools_text
                    text: qsTr("Notawanie")
                    font.pixelSize: 24
                }
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Dodaj Kategorię")
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Dodaj Podkategorię")
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Dodaj Konto")
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Dodaj Kontrahenta")
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Dodaj Centrum Kosztów")
            }

            Rectangle {
                id: budget_header
                width: root.width
                height: 50
                color: "#00ffffff"

                Text {
                    id: budget_text
                    text: qsTr("Planowanie")
                    font.pixelSize: 24
                }
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Zaplanuj Wydatki")
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Podsumowanie")
            }

            Rectangle {
                id: core_menu_header
                width: root.width
                height: 50
                color: "#00ffffff"

                Text {
                    id: core_menu_text
                    text: qsTr("")
                    font.pixelSize: 24
                }
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Konfiguracja")
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Pomoc")
            }

            Button {
                width: root.width * 0.8
                text: qsTr("Zakończ")
            }
        }
    }
}
