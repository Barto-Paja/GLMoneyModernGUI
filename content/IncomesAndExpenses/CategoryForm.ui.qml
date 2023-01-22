

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: root
    width: 600
    height: 200

    Rectangle {
        id: root_background
        anchors.fill: parent

        RowLayout {
            id: row
            anchors.fill: parent
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            spacing: 10

            Column {
                spacing: 5

                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    id: text1

                    text: qsTr("Dodaj nową kategorię")
                    font.pointSize: 14
                }

                TextEdit {
                    id: textEdit
                    width: 80
                    height: 20
                    text: qsTr("Text Edit")
                    font.pointSize: 14
                }

                Button {
                    text: qsTr("Dodaj")
                }
            }

            Column {
                spacing: 5

                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {

                    text: qsTr("Dodaj nową podkategorię")
                    font.pointSize: 14
                }

                ComboBox {
                    font.pointSize: 14
                }

                TextEdit {

                    width: 80
                    height: 20
                    text: qsTr("Text Edit")
                    font.pointSize: 14
                }

                Button {
                    text: qsTr("Dodaj")
                }
            }
        }
    }
}
