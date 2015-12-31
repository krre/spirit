function createDynamicObject(parent, url, properties) {
    var component = Qt.createComponent(url)
    var errorMessage = component.errorString()
    if (errorMessage) {
        print(errorMessage)
    } else {
        return component.createObject(parent, properties || {})
    }
}

function createAI(dirPath) {
    Core.mkpath(dirPath + "/log") // create work dir and log dir simultaneously
    var name = Core.pathToBaseName(dirPath)
    var spiritPath = dirPath + "/" + name + ".spirit"
    Storage.create(spiritPath)
    workArea.name = name
    workArea.workFilePath = spiritPath
    addRecentFile(spiritPath)
}

function openAI(filePath) {
    workArea.name = Core.pathToBaseName(filePath)
    workArea.workFilePath = filePath
    addRecentFile(filePath)
}

function closeAI() {
    workArea.name = ""
    workArea.workFilePath = ""
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
