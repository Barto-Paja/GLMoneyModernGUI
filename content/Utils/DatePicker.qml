import QtQuick 6.4
import QtQuick.Controls 6.4

DatePickerForm {

    property var currentDate: new Date()
    property var lastDayOfMontDate: new Date(currentDate.getFullYear(),currentDate.getMonth()+1,0);
    property var locale: Qt.locale("pl_PL")
    property var selectedDate: currentDate

    signal dateChanged

    datesView.model: CalendarModel {
        id: c_model

        from: new Date(currentDate.getFullYear(),currentDate.getMonth(),1)
        to: new Date(lastDayOfMontDate.getFullYear(),lastDayOfMontDate.getMonth(),lastDayOfMontDate.getDate())
    }

    datesView.delegate: MonthGrid {
        id: m_grid

        width: datesView.width
        height: datesView.height

        locale: locale

        onClicked: function (date) {
            selectedDate = date
            monthName.text = selectedDate.toLocaleDateString()
            dateChanged()
        }
    }

    monthName.text: locale.standaloneMonthName(currentDate.getMonth()) + " " + currentDate.getFullYear()

}
