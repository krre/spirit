QT += widgets qml quick

CONFIG += c++11
TEMPLATE = app

SOURCES += \
    src/cpp/main.cpp \
    src/cpp/base/core.cpp \
    src/cpp/base/settings.cpp \
    src/cpp/base/storage.cpp

RESOURCES += \
    src/spirit.qrc

DISTFILES += \
    README.md \
    src/qml/main.qml \
    src/qml/main/MainMenu.qml \
    src/js/utils.js \
    src/qml/main/About.qml \
    src/qml/components/ButtonBase.qml \
    src/qml/components/WindowDialog.qml \
    src/qml/main/NewAI.qml \
    src/qml/components/BrowseButton.qml \
    src/qml/main/Options.qml \
    src/qml/components/filedialog/FileDialogBase.qml \
    src/qml/components/filedialog/FileDialogDirectory.qml \
    src/qml/components/filedialog/FileDialogOpen.qml \
    src/qml/components/messagedialog/MessageDialogBase.qml \
    src/qml/components/messagedialog/MessageDialogError.qml \
    src/qml/components/messagedialog/MessageDialogInformation.qml \
    src/qml/components/messagedialog/MessageDialogQuestion.qml \
    src/qml/components/messagedialog/MessageDialogWarning.qml \
    src/js/dialog.js \
    src/qml/main/WorkArea.qml \
    src/qml/console/Console.qml \
    src/qml/console/sign/SignBase.qml \
    src/qml/console/sign/SignLib.qml \
    src/qml/console/sign/SignButton.qml \
    src/qml/console/sign/SpiritSign.qml \
    src/qml/console/Messages.qml \
    src/qml/console/Actions.qml \
    src/qml/console/Environment.qml \
    src/qml/console/sign/SignHuman.qml

HEADERS += \
    src/cpp/base/core.h \
    src/cpp/base/settings.h \
    src/cpp/base/storage.h
