

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import "IncomesAndExpenses"

Item {
    width: 1920
    height: 1080

    Row {

        width: 1920
        height: 1080

        NavBar {
            width: parent.width * 0.2
            height: parent.height
        }

        StackLayout {
            id: main_stack

            width: parent.width * 0.8
            height: parent.height

            currentIndex: 0

            StartPage {
                anchors.fill: parent
            }

            IncomesAndExpenses {
                anchors.fill: parent
            }

            DictionariesForm {
                anchors.fill: parent
            }
        }
    }
}
