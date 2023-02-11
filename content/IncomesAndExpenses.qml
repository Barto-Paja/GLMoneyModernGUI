import QtQuick 2.15
import QtQuick.Controls 2.15
import "Utils"
import "IncomesAndExpenses"

IncomesAndExpensesForm {

    thirdStep.buttonCommit.onClicked:{

        var multiplicand = -1;

        if(secondStep.switchIncome.checked)
        {
            multiplicand = 1;
        }

        var out = secondStep.textFieldAmount.text;
        out = out.replace(",",".");

        if(DataBaseCursor.addNewTransaction(
                    firstStep.datePicker.selectedDate,
                    secondStep.comboboxPayees.currentValue,
                    parseFloat(out).toFixed(2),
                    thirdStep.comboboxSubcategories.currentValue,
                    thirdStep.comboboxMembers.currentValue,
                    firstStep.comboboxAccounts.currentValue,
                    secondStep.textAreaNotes.text,
                    multiplicand,
                    ""
                    ))
        {
            messageBox.message = "Dodano tranakcję pomyślnie.";
            messageBox.messageColor = "green"
        }
        else
        {
            messageBox.message = "Dodanie tranakcji nie powiodło się.";
            messageBox.messageColor = "red"
        }

        messageBox.visible = true;
    }

    messageBox.button.onClicked:{
        messageBox.visible = false;
    }

    secondStep.comboboxPayees.editable: true;

    secondStep.comboboxPayees.onCurrentTextChanged: {
        secondStep.comboboxPayees.currentIndex = secondStep.comboboxPayees.find(secondStep.comboboxPayees.currentText);
    }
}
