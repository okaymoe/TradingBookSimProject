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

    //Global properties that will be accessible to all components
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

        //Side Navigation
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

                //Portfolio Tab
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

                // Analytics Tab
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

                //Spacer to push settings to bottom
                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                //Settings Tab
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

        //Main Content Area
        StackLayout {
            currentIndex: currentTabIndex
            Layout.fillWidth: true
            Layout.fillHeight: true

            TradingTab {
                id: tradingTabContent
            }

            PortfolioTab {
                id: portfolioTabContent
            }

            AnalyticsTab {
                id: analyticsTabContent
            }

            SettingsTab {
                id: settingsTabContent
            }
        }
    }

    Component.onCompleted: {
        portfolioManager.initializeFunds(100000)
    }
}
