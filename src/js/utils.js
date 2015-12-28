function createDynamicObject(parent, url, properties) {
    var component = Qt.createComponent(url)
    var errorMessage = component.errorString()
    if (errorMessage) {
        print(errorMessage)
    } else {
        return component.createObject(parent, properties || {})
    }
}

function createAI(filePath) {
    print("Create AI", filePath)
}

function openAI(filePath) {
    print("Open AI", filePath)
}
