

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
    width: 320
    height: 160
    scale: 1
    visible: true

    property alias rootVisible: root.visible

    property alias button: button
    property alias message: name.text
    property alias messageColor: background.border.color

    Rectangle {
        id: background
        border.color: "green"
        border.width: 5
        anchors.fill: parent
        radius: 10

        ColumnLayout {
            id: column
            anchors.fill: parent

            Text {
                id: name
                text: qsTr("")
                wrapMode: Text.WordWrap
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                //anchors.horizontalCenter: column.horizontalCenter
                font.pointSize: 25
            }

            Button {
                id: button
                text: qsTr("OK")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                //anchors.horizontalCenter: column.horizontalCenter
            }
        }
    }
}
