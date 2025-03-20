import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        anchors.margins: 16
        color: root.cardColor
        radius: 8

        Text {
            anchors.centerIn: parent
            text: qsTr("Analytics Coming Soon")
            font.pixelSize: 24
            color: root.textColor
        }
    }
}
