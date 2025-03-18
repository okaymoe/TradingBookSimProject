import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import TradingProject 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Trading Project")

    TradingEngine {
        id: tradingEngine
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            id: priceText
            text: qsTr("Current Price: ") + tradingEngine.price.toFixed(2)
            font.pointSize: 20
        }

        Button {
            text: qsTr("Simulate Trade")
            onClicked: tradingEngine.simulateTrade()
        }
    }
}
