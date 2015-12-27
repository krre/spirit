QT += widgets qml quick

CONFIG += c++11
TEMPLATE = app

SOURCES += \
    src/cpp/main.cpp

RESOURCES += \
    src/spirit.qrc

DISTFILES += \
    src/qml/main.qml \
    README.md \
    src/qml/main/MainMenu.qml \
    src/js/utils.js
