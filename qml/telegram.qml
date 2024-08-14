import QtQuick 2.12
import QtQuick.Layouts 1.15

Item {
    id: container
    property var side_menus : ['menu1', 'menu2']
    property int side_bar_width : 50

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
