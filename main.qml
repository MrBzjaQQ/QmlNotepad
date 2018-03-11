import QtQuick 2.10
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import com.myinc.TextEditor 1.0
Window {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint
    TextEditor {
        id: editor
    }

    Background {
    }
    MenuBar {
        background: Rectangle{
            color: "#92e7ff"
        }
         Menu {
             title: qsTr("&File")
             Action { text: qsTr("&New...") }
             Action { text: qsTr("&Open...")
             onTriggered: textEdit.text = editor.openFile()
             }
             Action { text: qsTr("&Save")
                 onTriggered: editor.saveFile(textEdit.text)
             }
             Action { text: qsTr("Save &As...") }
             MenuSeparator { }
             Action { text: qsTr("&Quit")
             onTriggered: close()}
         }
         Menu {
             title: qsTr("&Edit")
             Action { text: qsTr("Cu&t") }
             Action { text: qsTr("&Copy") }
             Action { text: qsTr("&Paste") }
             MenuSeparator { }
             Menu {
                 title: qsTr("&Find/Replace")
                 Action { text: qsTr("Find &Next") }
                 Action { text: qsTr("Find &Previous") }
                 Action { text: qsTr("&Replace...") }
             }
         }
         Menu {
             title: qsTr("&Help")
             Action { text: qsTr("&About") }
         }
}
         TextEdit {
             id: textEdit
             x: 32
             y: 48
             width: 570
             height: 395
             text: qsTr("Text Edit")
             font.pixelSize: 12
         }
         Button {
             id: closeButton
             x: mainWindow.width - width
             y: 0
             width: 35
             height: 35
             text: "X"
             background: Rectangle {
                 id: rectangleBack
                 x: parent.x
                 y: parent.x
                 height: parent.height
                 width: parent.width
                 color: "#8f8f8f"
             }
             onPressed: {
                  close()
             }
         }
         MouseArea {
             property int previousX: x
             property int previousY: y
             cursorShape: Qt.PointingHandCursor
             x: parent.width / 3 - 70
             y: 0
             height: 34
             width: 2*parent.width / 3
             onPressed: {
                 if(mouse.button === Qt.LeftButton)
                 {
                     previousX = mouseX
                     previousY = mouseY
                 }
             }
             onMouseXChanged: {
                     var dx = mouseX - previousX
                     mainWindow.setX(mainWindow.x + dx)
             }
             onMouseYChanged: {
                     var dy = mouseY - previousY
                     mainWindow.setY(mainWindow.y + dy)
             }
         }
}
