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
    print("Create AI", dirPath)
    Core.mkpath(dirPath + "/log") // create work dir and log dir simultaneously
}

function openAI(dirPath) {
    print("Open AI", dirPath)
}
