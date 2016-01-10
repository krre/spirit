import QtQuick 2.6
import QtQuick.Scene3D 2.0
import Qt3D.Core 2.0
import Qt3D.Render 2.0

Rectangle {
    property string name
    property string workFilePath
    property alias camera: camera
    color: "gray"

    Scene3D {
        id: scene3d
        anchors.fill: parent
        focus: true
        aspects: "input"

        Entity {
            id: sceneRoot

            Camera {
                id: camera
                projectionType: CameraLens.PerspectiveProjection
                fieldOfView: 45
                aspectRatio: scene3d.width / scene3d.height
                nearPlane : 0.1
                farPlane : 1000.0

                Component.onCompleted: reset()

                function reset() {
                    position = Qt.vector3d(0.0, 0.0, -40.0)
                    upVector = Qt.vector3d(0.0, 1.0, 0.0)
                    viewCenter = Qt.vector3d(0.0, 0.0, 0.0)
                }

                function zoomIn() {
                    position = Qt.vector3d(position.x, position.y, Math.min(position.z + 10, -10))
                }

                function zoomOut() {
                    position = Qt.vector3d(position.x, position.y, position.z - 10)
                }
            }

            Configuration  {
                controlledCamera: camera
            }

            components: [
                FrameGraph {
                    activeFrameGraph: Viewport {
                        id: viewport
                        rect: Qt.rect(0.0, 0.0, 1.0, 1.0) // From Top Left
                        clearColor: "transparent"

                        CameraSelector {
                            id : cameraSelector
                            camera: camera

                            ClearBuffer {
                                buffers : ClearBuffer.ColorDepthBuffer
                            }
                        }
                    }
                }
            ]

            PhongMaterial {
                id: material
                diffuse: Qt.rgba(0.4, 0.7, 0.0, 1.0)
            }

            CuboidMesh {
                id: cuboidMesh
                xExtent: 10
                yExtent: 10
                zExtent: 10
            }

            Transform {
                id: cuboidTransform
            }

            Entity {
                id: cuboidEntity
                components: [cuboidMesh, material, cuboidTransform]
            }
        }
    }
}
