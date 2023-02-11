import QtQuick 2.15

CoreWindowForm {
    navbar.buttonHelp.onClicked: {
        main_stackCurrentIndex = 0;
    }

    navbar.buttonIaE.onClicked:{
        main_stackCurrentIndex = 1;
    }

    navbar.buttonDictionaries.onClicked: {
        main_stackCurrentIndex = 2;
    }

    navbar.buttonQuit.onClicked: {
        Qt.quit();
    }
}
