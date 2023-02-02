cmake_minimum_required(VERSION 3.18)

project(GLMoneyModernGUIApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(QML_IMPORT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/content)

set(HEADERS
    src/DataStructs.hpp
    src/databasecursor.hpp
)
set(SOURCES
    src/databasecursor.cpp
    src/DataStructs.cpp
)



find_package(Qt6 COMPONENTS Sql Gui Qml Quick QuickControls2)
qt_add_executable(GLMoneyModernGUIApp src/main.cpp ${HEADERS} ${SOURCES})

qt_add_resources(GLMoneyModernGUIApp "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
)

target_include_directories(GLMoneyModernGUIApp PRIVATE src)

target_link_libraries(GLMoneyModernGUIApp PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Sql
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Qml
)

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)
