QT += widgets qml quick

CONFIG += c++11
TEMPLATE = app

SOURCES += \
    src/cpp/main.cpp \
    src/cpp/base/core.cpp \
    src/cpp/base/settings.cpp

RESOURCES += \
    src/spirit.qrc

DISTFILES += \
    README.md \
    src/qml/main.qml \
    src/qml/main/MainMenu.qml \
    src/js/utils.js \
    src/qml/main/About.qml

HEADERS += \
    src/cpp/base/core.h \
    src/cpp/base/settings.h
