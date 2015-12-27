QT += widgets qml quick

CONFIG += c++11
TEMPLATE = app

SOURCES += \
    src/cpp/main.cpp

RESOURCES += \
    src/spirit.qrc

DISTFILES += \
    src/qml/main.qml \
    README.md
