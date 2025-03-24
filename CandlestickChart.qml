import QtQuick 2.15
import QtCharts

ChartView {
    id: chartView
    anchors.fill: parent
    antialiasing: true
    legend.visible: false

    ValuesAxis {
        id: axisX
        // For a time scale, consider a CategoryAxis if needed.
        min: 0
        max: 10
    }
    ValuesAxis {
        id: axisY
        min: 0
        max: 1000  // Adjust according to your expected price range.
    }

    // The CandleStickSeries is used to display OHLC data.
    CandlestickSeries {
        id: candleSeries
        axisX: axisX
        axisY: axisY
    }

}
