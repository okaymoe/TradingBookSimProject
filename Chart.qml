import QtQuick 2.15
import QtCharts 2.15

ChartView {
    id: chartView
    anchors.fill: parent
    antialiasing: true
    legend.visible: false

    property var chartData: []

    ValuesAxis {
        id: axisX
        min: 0
        max: chartData.length > 0 ? chartData.length - 1 : 10
    }
    ValuesAxis {
        id: axisY
        min: 0
        max: {
            var maxVal = 0;
            for (var i = 0; i < chartData.length; i++)
                maxVal = Math.max(maxVal, chartData[i].high);
            return maxVal * 1.1;
        }
    }

    CandlestickSeries {
        id: candleSeries
        axisX: axisX
        axisY: axisY
    }

    function updateChart() {
        candleSeries.clear();
        for (var i = 0; i < chartData.length; i++) {
            candleSeries.append(i, chartData[i].open, chartData[i].high, chartData[i].low, chartData[i].close);
        }
    }

    onChartDataChanged: {
        console.log("chartData changed, length:", chartData.length);
        updateChart();
    }
}
