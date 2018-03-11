import QtQuick 2.10
import QtQuick.Controls 2.3

Rectangle {
    id: rectangle2
    width: 640
    height: 480
    color: "#b2cbff"
    clip: true


    Rectangle {
        id: rectangle
        x: 31
        y: 47
        width: 582
        height: 399
        color: "#b3eefe"
    }

    Rectangle {
        id: rectangle1
        x: 585
        y: -128
        width: 200
        height: 200
        color: "#92e7ff"
        clip: false
        rotation: 45
    }
}
