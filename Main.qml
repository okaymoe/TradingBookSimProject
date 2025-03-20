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

    property int sidebarWidth: 80
    property int currentTabIndex: 0

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // Side Navigation
        Rectangle {
            Layout.preferredWidth: sidebarWidth
            Layout.fillHeight: true
            color: bgColor
            border.color: borderColor
            border.width: 0

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                // App Logo
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 60
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: "TP"
                        font.pixelSize: 24
                        font.bold: true
                        color: accentColor
                    }
                }

                // Divider
                Rectangle {
                    Layout.fillWidth: true
                    height: 1
                    color: borderColor
                }

                // Trading Tab
                Rectangle {
                    id: tradingTab
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    color: currentTabIndex === 0 ? Qt.rgba(0.13, 0.59, 0.95, 0.1) : "transparent"
                    border.color: currentTabIndex === 0 ? accentColor : "transparent"
                    border.width: currentTabIndex === 0 ? 2 : 0

                    Rectangle {
                        visible: currentTabIndex === 0
                        width: 3
                        height: parent.height
                        color: accentColor
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: currentTabIndex = 0
                        cursorShape: Qt.PointingHandCursor
                    }

                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 4

                        // Trading Icon
                        Rectangle {
                            Layout.alignment: Qt.AlignHCenter
                            width: 24
                            height: 24
                            color: "transparent"

                            Canvas {
                                anchors.fill: parent
                                onPaint: {
                                    var ctx = getContext("2d");
                                    ctx.reset();
                                    ctx.strokeStyle = currentTabIndex === 0 ? accentColor : secondaryTextColor;
                                    ctx.lineWidth = 2;

                                    // Draw a simple chart icon
                                    ctx.beginPath();
                                    ctx.moveTo(2, 22);
                                    ctx.lineTo(2, 8);
                                    ctx.lineTo(8, 14);
                                    ctx.lineTo(14, 6);
                                    ctx.lineTo(22, 12);
                                    ctx.stroke();
                                }
                            }
                        }

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: qsTr("Trading")
                            font.pixelSize: 12
                            color: currentTabIndex === 0 ? accentColor : secondaryTextColor
                        }
                    }
                }

                // Portfolio Tab
                Rectangle {
                    id: portfolioTab
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    color: currentTabIndex === 1 ? Qt.rgba(0.13, 0.59, 0.95, 0.1) : "transparent"
                    border.color: currentTabIndex === 1 ? accentColor : "transparent"
                    border.width: currentTabIndex === 1 ? 2 : 0

                    Rectangle {
                        visible: currentTabIndex === 1
                        width: 3
                        height: parent.height
                        color: accentColor
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: currentTabIndex = 1
                        cursorShape: Qt.PointingHandCursor
                    }

                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 4

                        // Portfolio Icon
                        Rectangle {
                            Layout.alignment: Qt.AlignHCenter
                            width: 24
                            height: 24
                            color: "transparent"

                            Canvas {
                                anchors.fill: parent
                                onPaint: {
                                    var ctx = getContext("2d");
                                    ctx.reset();
                                    ctx.strokeStyle = currentTabIndex === 1 ? accentColor : secondaryTextColor;
                                    ctx.lineWidth = 2;

                                    // Draw a simple briefcase icon
                                    ctx.beginPath();
                                    ctx.moveTo(4, 8);
                                    ctx.lineTo(20, 8);
                                    ctx.lineTo(20, 20);
                                    ctx.lineTo(4, 20);
                                    ctx.closePath();
                                    ctx.moveTo(8, 8);
                                    ctx.lineTo(8, 4);
                                    ctx.lineTo(16, 4);
                                    ctx.lineTo(16, 8);
                                    ctx.stroke();
                                }
                            }
                        }

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: qsTr("Portfolio")
                            font.pixelSize: 12
                            color: currentTabIndex === 1 ? accentColor : secondaryTextColor
                        }
                    }
                }

                // Placeholder for future tabs
                Rectangle {
                    id: analyticsTab
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    color: currentTabIndex === 2 ? Qt.rgba(0.13, 0.59, 0.95, 0.1) : "transparent"
                    border.color: currentTabIndex === 2 ? accentColor : "transparent"
                    border.width: currentTabIndex === 2 ? 2 : 0

                    Rectangle {
                        visible: currentTabIndex === 2
                        width: 3
                        height: parent.height
                        color: accentColor
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: currentTabIndex = 2
                        cursorShape: Qt.PointingHandCursor
                    }

                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 4

                        // Analytics Icon
                        Rectangle {
                            Layout.alignment: Qt.AlignHCenter
                            width: 24
                            height: 24
                            color: "transparent"

                            Canvas {
                                anchors.fill: parent
                                onPaint: {
                                    var ctx = getContext("2d");
                                    ctx.reset();
                                    ctx.strokeStyle = currentTabIndex === 2 ? accentColor : secondaryTextColor;
                                    ctx.lineWidth = 2;

                                    // Draw a simple pie chart icon
                                    ctx.beginPath();
                                    ctx.arc(12, 12, 10, 0, Math.PI * 2);
                                    ctx.moveTo(12, 12);
                                    ctx.lineTo(12, 2);
                                    ctx.moveTo(12, 12);
                                    ctx.lineTo(20, 16);
                                    ctx.stroke();
                                }
                            }
                        }

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: qsTr("Analytics")
                            font.pixelSize: 12
                            color: currentTabIndex === 2 ? accentColor : secondaryTextColor
                        }
                    }
                }

                // Spacer to push settings to bottom
                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                // Settings Tab (at bottom)
                Rectangle {
                    id: settingsTab
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    color: currentTabIndex === 3 ? Qt.rgba(0.13, 0.59, 0.95, 0.1) : "transparent"
                    border.color: currentTabIndex === 3 ? accentColor : "transparent"
                    border.width: currentTabIndex === 3 ? 2 : 0

                    Rectangle {
                        visible: currentTabIndex === 3
                        width: 3
                        height: parent.height
                        color: accentColor
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: currentTabIndex = 3
                        cursorShape: Qt.PointingHandCursor
                    }

                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 4

                        // Settings Icon
                        Rectangle {
                            Layout.alignment: Qt.AlignHCenter
                            width: 24
                            height: 24
                            color: "transparent"

                            Canvas {
                                anchors.fill: parent
                                onPaint: {
                                    var ctx = getContext("2d");
                                    ctx.reset();
                                    ctx.strokeStyle = currentTabIndex === 3 ? accentColor : secondaryTextColor;
                                    ctx.lineWidth = 2;

                                    // Draw a simple gear icon
                                    ctx.beginPath();
                                    ctx.arc(12, 12, 6, 0, Math.PI * 2);

                                    // Draw gear teeth
                                    for (var i = 0; i < 8; i++) {
                                        var angle = i * Math.PI / 4;
                                        var x1 = 12 + 8 * Math.cos(angle);
                                        var y1 = 12 + 8 * Math.sin(angle);
                                        var x2 = 12 + 10 * Math.cos(angle);
                                        var y2 = 12 + 10 * Math.sin(angle);
                                        ctx.moveTo(x1, y1);
                                        ctx.lineTo(x2, y2);
                                    }

                                    ctx.stroke();
                                }
                            }
                        }

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: qsTr("Settings")
                            font.pixelSize: 12
                            color: currentTabIndex === 3 ? accentColor : secondaryTextColor
                        }
                    }
                }
            }
        }

        // Main Content Area
        StackLayout {
            currentIndex: currentTabIndex
            Layout.fillWidth: true
            Layout.fillHeight: true

            // Trading Tab Content
            Item {
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

                                        // Update portfolio when placing an order
                                        portfolioManager.placeOrder(symbolField.text, qty, dataManager.currentPrice, orderTypeCombo.currentText)
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

            // Portfolio Tab Content
            Item {
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 16

                    // Funds Display
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 80
                        color: cardColor
                        radius: 8

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 16
                            spacing: 16

                            Text {
                                text: qsTr("Available Funds:")
                                font.pixelSize: 18
                                font.bold: true
                                color: textColor
                            }

                            Text {
                                text: "$" + portfolioManager.totalFunds.toFixed(2)
                                font.pixelSize: 24
                                font.bold: true
                                color: positiveColor
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
                                    color: parent.down ? Qt.darker(accentColor, 1.2) :
                                           parent.hovered ? Qt.lighter(accentColor, 1.1) : accentColor
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
                        color: cardColor
                        radius: 8

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 16
                            spacing: 12

                            Text {
                                text: qsTr("Current Holdings")
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
                                        text: qsTr("Avg. Price")
                                        Layout.preferredWidth: 120
                                        font.pixelSize: 14
                                        font.bold: true
                                        color: secondaryTextColor
                                    }
                                    Text {
                                        text: qsTr("Current Value")
                                        Layout.fillWidth: true
                                        font.pixelSize: 14
                                        font.bold: true
                                        color: secondaryTextColor
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
                                            color: textColor
                                        }
                                        Text {
                                            text: modelData.quantity
                                            Layout.preferredWidth: 100
                                            font.pixelSize: 14
                                            color: textColor
                                        }
                                        Text {
                                            text: "$" + modelData.averagePrice.toFixed(2)
                                            Layout.preferredWidth: 120
                                            font.pixelSize: 14
                                            color: textColor
                                        }
                                        Text {
                                            // For simplicity, using current price for all symbols
                                            text: "$" + (modelData.quantity * dataManager.currentPrice).toFixed(2)
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

            // Analytics Tab Content (Placeholder)
            Item {
                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 16
                    color: cardColor
                    radius: 8

                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Analytics Coming Soon")
                        font.pixelSize: 24
                        color: textColor
                    }
                }
            }

            // Settings Tab Content (Placeholder)
            Item {
                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 16
                    color: cardColor
                    radius: 8

                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Settings Coming Soon")
                        font.pixelSize: 24
                        color: textColor
                    }
                }
            }
        }
    }

    // Initialize with some funds when the application starts
    Component.onCompleted: {
        portfolioManager.initializeFunds(100000)
    }
}
