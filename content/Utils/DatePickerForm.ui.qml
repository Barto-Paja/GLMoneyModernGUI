

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.4
import QtQuick.Controls 6.4

Item {
    id: root

    width: 200
    height: 200

    property alias datesView: dates_view
    property alias monthName: month_Name

    Column {
        id: column

        width: root.width
        height: root.height

        Rectangle {
            id: month_Name_Block
            width: column.width
            height: column.height * 0.2
            color: "#2aafd3"

            Label {
                id: month_Name

                width: month_Name_Block.width
                height: month_Name_Block.height
                color: "#ddffffff"

                text: qsTr("Label")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: false
                font.family: "Tahoma"
                font.pointSize: 16
            }
        }

        Rectangle {

            id: rectangle

            width: root.width
            height: root.height * 0.8
            color: "#ffffff"

            ListView {
                id: dates_view

                width: rectangle.width
                height: rectangle.height
                snapMode: ListView.SnapOneItem
                orientation: ListView.Horizontal
                highlightRangeMode: ListView.StrictlyEnforceRange

                ScrollIndicator.horizontal: ScrollIndicator {}
            }
        }
    }
}
