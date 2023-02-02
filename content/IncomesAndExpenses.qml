import QtQuick 2.15
import QtQuick.Controls 2.15
import "Utils"

IncomesAndExpensesForm {

    comboBoxCategories.onActivated: {
        DataBaseCursor.loadSelectedCategory(comboBoxCategories.currentValue);
        comboBoxSubcategories.model = DataBaseCursor.selectedSubcategories;
    }
}
