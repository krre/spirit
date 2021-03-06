.import QtQuick 2.6 as QtQuick

function createDynamicObject(parent, url, properties) {
    var component = Qt.createComponent(url)
    if (component.status === QtQuick.Component.Ready) {
        return component.createObject(parent, properties || {})
    } else {
        print(component.errorString())
    }
}

function createAI(dirPath) {
    closeAI()
    Core.mkpath(dirPath + "/log") // create work dir and log dir simultaneously
    var name = Core.pathToBaseName(dirPath)
    var filePath = dirPath + "/" + name + ".spirit"
    Brain.create(filePath)
    openAI(filePath)
}

function openAI(filePath) {
    closeAI()
    workArea.name = Core.pathToBaseName(filePath)
    workArea.workFilePath = filePath
    addRecentFile(filePath)
    Brain.start(filePath)
}

function closeAI() {
    Brain.stop()
    workArea.name = ""
    workArea.workFilePath = ""
}

function saveGeometry(name) {
    var geometry = {}
    geometry.x = x
    geometry.y = y
    geometry.width = width
    geometry.height = height
    Settings.setMap(name, geometry)
}

function loadGeomerty(name) {
    var geometry = Settings.map(name)
    if (Object.keys(geometry).length) {
        x = geometry.x
        y = geometry.y
        width = geometry.width
        height = geometry.height
    } else {
        if (Screen.width && Screen.height) {
            x = (Screen.width - width) / 2
            y = (Screen.height - height) / 2
        } else {
            x = 200
            y = 200
        }
    }
}

function addRecentFile(path) {
    var model = mainMenu.recentFilesModel
    // Prevention of duplication of filePath and raising it on top.
    for (var i = 0; i < model.count; i++) {
        if (model.get(i).filePath === path) {
            model.remove(i)
        }
    }
    model.insert(0, { filePath: path })
    var maxRecentFiles = 10
    if (model.count === maxRecentFiles + 1) {
        model.remove(maxRecentFiles)
    }
}

function saveRecentFiles() {
    var model = mainMenu.recentFilesModel
    var list = []
    for (var i = 0; i < model.count; i++) {
        var path = model.get(i).filePath
        if (path) {
            list.push(path)
        }
    }
    Settings.setList("RecentFiles", list)
}

function loadRecentFiles() {
    var list = Settings.list("RecentFiles")
    var model = mainMenu.recentFilesModel
    for (var i = 0; i < list.length; i++) {
        var path = list[i]
        if (Core.isFileExists(path)) {
            model.append({ filePath: path })
        }
    }
}

function loadSession() {
    if (Settings.value("Interface", "restoreLastSession")) {
        var workFilePath = Settings.value("Path", "lastWorkFile")
        if (workFilePath) {
            openAI(workFilePath)
        }

        var openWindowsList = Settings.list("OpenWindows")
        if (openWindowsList.length) {
            for (var i in openWindowsList) {
                var window = openWindowsList[i]
                if (window === "Console") {
                    mainMenu.consoleAI.trigger()
                } else if (window === "Log") {
                    mainMenu.log.trigger()
                }
            }
        }
    }
}

function saveSession() {
    if (Settings.value("Interface", "restoreLastSession")) {
        Settings.setValue("Path", "lastWorkFile", workArea.workFilePath)

        var openWindowsList = []
        if (consoleWindow) {
            openWindowsList.push("Console")
        }

        if (logWindow) {
            openWindowsList.push("Log")
        }

        Settings.setList("OpenWindows", openWindowsList)
    }
}
