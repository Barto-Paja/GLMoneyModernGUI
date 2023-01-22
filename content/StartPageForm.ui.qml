

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
        id: root_background
        width: parent.width
        height: parent.height

        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0
                color: "#fff49d"
            }

            GradientStop {
                position: 1
                color: "#fda085"
            }
        }

        Column {
            id: root_columns
            anchors.fill: parent

            TextArea {
                text: "# Cześć \n
Fajnie, że zdecydowałeś na skorzystanie z aplikacji. Mam nadzieję, że będzie Ci się jej dobrze używało.\n
Poniżej masz linki do nagrań, które pomogą Ci postawić pierwsze kroki w używaniu tej aplikacji.\n
W razie czego zawszesz możesz napisać zapytanie o pomoc zgłaszając się w repozytorium kodu."
                textFormat: Text.MarkdownText
            }
        }
    }
}
