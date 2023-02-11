import QtQuick 2.15
import QtQuick.Controls 2.15

IaEThirdStepForm {

        comboboxCategories.currentIndex: 0;
        comboboxCategories.onActivated: {
            DataBaseCursor.loadSelectedCategory(comboboxCategories.currentValue);
            comboboxSubcategories.model = DataBaseCursor.selectedSubcategories;
        }

        Component.onCompleted:{ comboboxCategories.currentIndex = 0; comboboxCategories.activated(comboboxCategories.currentIndex); }

}
