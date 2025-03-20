import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 16

        // Funds Display
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            color: root.cardColor
            radius: 8

            RowLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 16

                Text {
                    text: qsTr("Available Funds:")
                    font.pixelSize: 18
                    font.bold: true
                    color: root.textColor
                }

                Text {
                    text: "$" + portfolioManager.totalFunds.toFixed(2)
                    font.pixelSize: 24
                    font.bold: true
                    color: root.positiveColor
                }

                Item { Layout.fillWidth: true }

                Button {
                    text: qsTr("Add Funds")
                    contentItem: Text {
                        text: parent.text
                        color: "#FFFFFF"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    background: Rectangle {
                        color: parent.down ? Qt.darker(root.accentColor, 1.2) :
                               parent.hovered ? Qt.lighter(root.accentColor, 1.1) : root.accentColor
                        radius: 4
                        implicitHeight: 40
                        implicitWidth: 120
                    }
                    onClicked: {
                        // Simple implementation - in a real app, you'd show a dialog
                        portfolioManager.initializeFunds(portfolioManager.totalFunds + 10000)
                    }
                }
            }
        }

        // Holdings List
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: root.cardColor
            radius: 8

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                Text {
                    text: qsTr("Current Holdings")
                    font.pixelSize: 18
                    font.bold: true
                    color: root.textColor
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 40
                    color: root.bgColor
                    radius: 4

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 16
                        anchors.rightMargin: 16

                        Text {
                            text: qsTr("Symbol")
                            Layout.preferredWidth: 100
                            font.pixelSize: 14
                            font.bold: true
                            color: root.secondaryTextColor
                        }
                        Text {
                            text: qsTr("Quantity")
                            Layout.preferredWidth: 100
                            font.pixelSize: 14
                            font.bold: true
                            color: root.secondaryTextColor
                        }
                        Text {
                            text: qsTr("Avg. Price")
                            Layout.preferredWidth: 120
                            font.pixelSize: 14
                            font.bold: true
                            color: root.secondaryTextColor
                        }
                        Text {
                            text: qsTr("Current Value")
                            Layout.fillWidth: true
                            font.pixelSize: 14
                            font.bold: true
                            color: root.secondaryTextColor
                        }
                    }
                }

                ListView {
                    id: holdingsListView
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    model: portfolioManager.holdingsList()
                    spacing: 1

                    // Refresh the view when holdings change
                    Connections {
                        target: portfolioManager
                        function onHoldingsChanged() {
                            holdingsListView.model = portfolioManager.holdingsList()
                        }
                    }

                    ScrollBar.vertical: ScrollBar {
                        active: true
                    }

                    delegate: Rectangle {
                        width: holdingsListView.width
                        height: 50
                        color: index % 2 === 0 ? Qt.rgba(0.15, 0.15, 0.15, 1.0) : Qt.rgba(0.17, 0.17, 0.17, 1.0)

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16

                            Text {
                                text: modelData.symbol
                                Layout.preferredWidth: 100
                                font.pixelSize: 14
                                color: root.textColor
                            }
                            Text {
                                text: modelData.quantity
                                Layout.preferredWidth: 100
                                font.pixelSize: 14
                                color: root.textColor
                            }
                            Text {
                                text: "$" + modelData.averagePrice.toFixed(2)
                                Layout.preferredWidth: 120
                                font.pixelSize: 14
                                color: root.textColor
                            }
                            Text {
                                // For simplicity, using current price for all symbols
                                text: "$" + (modelData.quantity * dataManager.currentPrice).toFixed(2)
                                Layout.fillWidth: true
                                font.pixelSize: 14
                                color: root.textColor
                            }
                        }
                    }
                }
            }
        }
    }
}
