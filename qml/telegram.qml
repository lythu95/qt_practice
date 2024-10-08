import QtQuick 2.12
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Item {
    id: container
    property var side_menus : ['menu1', 'menu2']
    property int side_bar_width : 50

    ShaderEffectSource {
        id: bkgMask
        sourceItem: background
        smooth: true
        sourceRect: Qt.rect(0,0,parent.width, parent.height)
    }

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 8
        visible: true

        RowLayout {
            id: mainLayout
            anchors.fill: parent
            spacing: 0
            height: 200

            Rectangle {
                id: sidebarBox
                Layout.maximumWidth: side_bar_width
                Layout.minimumWidth: side_bar_width
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "red"

                Text {
                    text: "left side bar"
                }
            }

            Rectangle {
                id: channelsBox
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: 100
                color: "blue"

                Text {
                    text: "Channel list box"
                }
            }

            Rectangle {
                id: chatBox
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: 200
                color: "yellow"

                Text {
                    text: "Chat content box"
                }
            }

            Rectangle {
                id: infoBox
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: 100
                color: "gray"

                Text {
                    text: "Closable info box"
                }
            }
        }
    }

    Rectangle {
        anchors.fill: bkgMask
        radius: background.radius
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: bkgMask
        }
    }
}
