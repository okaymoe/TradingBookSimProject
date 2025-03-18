import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: root
    visible: true
    width: 1000
    height: 700
    title: qsTr("Trading Port")
    color: "#121212"  // Dark background

    property color accentColor: "#2196F3"
    property color bgColor: "#1E1E1E"
    property color cardColor: "#252525"
    property color textColor: "#E0E0E0"
    property color secondaryTextColor: "#9E9E9E"
    property color borderColor: "#333333"
    property color positiveColor: "#4CAF50"
    property color negativeColor: "#F44336"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 16

        // Header with current stock price
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 120
            color: cardColor
            radius: 8

            RowLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 16

                Rectangle {
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 80
                    color: accentColor
                    radius: 40

                    Text {
                        anchors.centerIn: parent
                        text: "AAPL"
                        font.bold: true
                        font.pixelSize: 20
                        color: "#FFFFFF"
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 4

                    Text {
                        text: qsTr("Apple Inc.")
                        font.pixelSize: 18
                        font.bold: true
                        color: textColor
                    }

                    Text {
                        text: qsTr("NASDAQ: AAPL")
                        font.pixelSize: 14
                        color: secondaryTextColor
                    }
                }

                ColumnLayout {
                    Layout.alignment: Qt.AlignRight
                    spacing: 4

                    Text {
                        text: "$" + dataManager.currentPrice.toFixed(2)
                        font.pixelSize: 32
                        font.bold: true
                        color: textColor
                    }

                    Text {
                        text: "+2.45 (1.32%)"
                        font.pixelSize: 16
                        color: positiveColor
                    }
                }
            }
        }

        //Order Entry Panel
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 200
            color: cardColor
            radius: 8

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 16

                Text {
                    text: qsTr("Place Order")
                    font.pixelSize: 18
                    font.bold: true
                    color: textColor
                }

                GridLayout {
                    Layout.fillWidth: true
                    columns: 2
                    rowSpacing: 12
                    columnSpacing: 16

                    Text {
                        text: qsTr("Symbol:")
                        color: textColor
                        font.pixelSize: 14
                    }

                    TextField {
                        id: symbolField
                        Layout.fillWidth: true
                        placeholderText: qsTr("AAPL")
                        background: Rectangle {
                            color: "#2A2A2A"
                            border.color: borderColor
                            radius: 4
                        }
                        color: textColor
                        placeholderTextColor: secondaryTextColor
                    }

                    Text {
                        text: qsTr("Quantity:")
                        color: textColor
                        font.pixelSize: 14
                    }

                    TextField {
                        id: quantityField
                        Layout.fillWidth: true
                        placeholderText: qsTr("100")
                        inputMethodHints: Qt.ImhDigitsOnly
                        background: Rectangle {
                            color: "#2A2A2A"
                            border.color: borderColor
                            radius: 4
                        }
                        color: textColor
                        placeholderTextColor: secondaryTextColor
                    }

                    Text {
                        text: qsTr("Order Type:")
                        color: textColor
                        font.pixelSize: 14
                    }

                    ComboBox {
                        id: orderTypeCombo
                        Layout.fillWidth: true
                        model: ["Buy", "Sell"]

                        background: Rectangle {
                            color: "#2A2A2A"
                            border.color: borderColor
                            radius: 4
                        }

                        contentItem: Text {
                            text: orderTypeCombo.displayText
                            color: textColor
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: 8
                        }

                        popup: Popup {
                            y: orderTypeCombo.height
                            width: orderTypeCombo.width
                            padding: 1

                            background: Rectangle {
                                color: "#2A2A2A"
                                border.color: borderColor
                            }

                            contentItem: ListView {
                                clip: true
                                implicitHeight: contentHeight
                                model: orderTypeCombo.popup.visible ? orderTypeCombo.delegateModel : null

                                ScrollIndicator.vertical: ScrollIndicator {}
                            }
                        }

                        delegate: ItemDelegate {
                            width: orderTypeCombo.width

                            contentItem: Text {
                                text: modelData
                                color: textColor
                                verticalAlignment: Text.AlignVCenter
                            }

                            highlighted: orderTypeCombo.highlightedIndex === index

                            background: Rectangle {
                                color: highlighted ? accentColor : "transparent"
                            }
                        }
                    }
                }

                Button {
                    Layout.alignment: Qt.AlignRight
                    text: qsTr("Place Order")

                    contentItem: Text {
                        text: parent.text
                        color: "#FFFFFF"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    background: Rectangle {
                        color: parent.down ? Qt.darker(accentColor, 1.2) :
                               parent.hovered ? Qt.lighter(accentColor, 1.1) : accentColor
                        radius: 4
                        implicitHeight: 40
                        implicitWidth: 120
                    }

                    onClicked: {
                        var qty = parseInt(quantityField.text)
                        if (!isNaN(qty)) {
                            orderModel.addOrder(symbolField.text, qty, orderTypeCombo.currentText, dataManager.currentPrice)
                        }
                    }
                }
            }
        }

        //Order list
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: cardColor
            radius: 8

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                Text {
                    text: qsTr("Recent Orders")
                    font.pixelSize: 18
                    font.bold: true
                    color: textColor
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 40
                    color: bgColor
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
                            color: secondaryTextColor
                        }
                        Text {
                            text: qsTr("Quantity")
                            Layout.preferredWidth: 100
                            font.pixelSize: 14
                            font.bold: true
                            color: secondaryTextColor
                        }
                        Text {
                            text: qsTr("Type")
                            Layout.preferredWidth: 100
                            font.pixelSize: 14
                            font.bold: true
                            color: secondaryTextColor
                        }
                        Text {
                            text: qsTr("Price")
                            Layout.fillWidth: true
                            font.pixelSize: 14
                            font.bold: true
                            color: secondaryTextColor
                        }
                    }
                }

                ListView {
                    id: orderListView
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    model: orderModel
                    spacing: 1

                    ScrollBar.vertical: ScrollBar {
                        active: true
                    }

                    delegate: Rectangle {
                        width: orderListView.width
                        height: 50
                        color: index % 2 === 0 ? Qt.rgba(0.15, 0.15, 0.15, 1.0) : Qt.rgba(0.17, 0.17, 0.17, 1.0)

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16

                            Text {
                                text: symbol
                                Layout.preferredWidth: 100
                                font.pixelSize: 14
                                color: textColor
                            }
                            Text {
                                text: quantity
                                Layout.preferredWidth: 100
                                font.pixelSize: 14
                                color: textColor
                            }
                            Text {
                                text: orderType
                                Layout.preferredWidth: 100
                                font.pixelSize: 14
                                color: orderType === "Buy" ? positiveColor : negativeColor
                                font.bold: true
                            }
                            Text {
                                text: "$" + price.toFixed(2)
                                Layout.fillWidth: true
                                font.pixelSize: 14
                                color: textColor
                            }
                        }
                    }
                }
            }
        }
    }
}
