import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: appWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Table")

    // property alias items: listView.model
    property var items: []

    ListView {
        id: listView
        anchors.left: parent.left
        anchors.right: parent.right
        height: 480
        model: items
        ListModel {
            id: testModel

            ListElement {
                text1: 't1'
                image_path: "./img/_____jjh.jpg"
            }
            ListElement {
                text1: 't2'
                image_path: "./img/60_youkong.__.g.jpg"
            }
        }

        ScrollBar.vertical: ScrollBar {id : scrollbar}

        delegate: Rectangle {
            id: itemDelegate
            width: listView.width
            height: 120

            RowLayout {
                id: listRow
                spacing: 5
                anchors.fill: parent

                Text {
                    id: itemUserName
                    text: modelData.username
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: txtImagePath
                    visible: false
                    text: modelData.user_img
                }

                Image {
                    id: itemUserImage
                    Layout.preferredHeight: 100
                    Layout.preferredWidth: 100
                    source: "file:///" + applicationDirPath + modelData.user_img
                    // source:  modelData.user_img
                }

                Text {
                    id: itemFullName
                    width: 200
                    text: modelData.fullname
                    Layout.fillHeight: true
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }

                Item {
                    id: buttonWrap
                    width: 50
                    Layout.alignment: Qt.AlignVCenter
                    // anchors.verticalCenter: parent.verticalCenter
                    // anchors.left: itemFullName.right

                    Button {
                        id: btnVisitUrl
                        text: 'visit'
                        onClicked: console.log(modelData.url)
                    }
                }
            }
        }
    }
}
