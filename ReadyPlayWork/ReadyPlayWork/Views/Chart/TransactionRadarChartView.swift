//
//  TransactionRadarChartView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/29.
//

import SwiftUI
import DGCharts
import Charts
import UIKit

struct TransactionRadarChartView: UIViewRepresentable {

    let viewModel : RadarChartViewModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> DGCharts.RadarChartView {
        let view = DGCharts.RadarChartView()
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ chartView: DGCharts.RadarChartView, context: Context) {
        
        let chartData = viewModel.radarChartDatas()
        
        chartView.data = chartData
        chartView.webLineWidth = 1
        chartView.innerWebLineWidth = 1
        chartView.webColor = .gray
        chartView.innerWebColor = .lightGray
        chartView.webAlpha = 1
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 12,weight: .semibold)
        xAxis.xOffset = 0
        xAxis.yOffset = 0
        xAxis.labelTextColor = .black
        /// Connect AxisvalueFormatterDelegate
        xAxis.valueFormatter = context.coordinator
        /// x축 값 표시
        xAxis.drawLabelsEnabled = true
        
        let yAxis = chartView.yAxis
        /// y축 폰트
        yAxis.labelFont = .systemFont(ofSize: 10, weight: .thin)
        /// y축  갯수
        yAxis.labelCount = chartData.entryCount
        /// y축 시작값
        yAxis.axisMinimum = 0
        /// y축 최대표시값
        yAxis.axisMaximum = chartData.maxEntryCountSet?.yMax ?? 100
        /// 축 값 표시
        yAxis.drawLabelsEnabled = true
        
        /// 범례
        let l = chartView.legend
        l.horizontalAlignment = .center
        l.verticalAlignment = .top
        l.orientation = .horizontal
        l.drawInside = true
        l.font = .systemFont(ofSize: 15, weight: .bold)
        l.xEntrySpace = 10
        l.yEntrySpace = 10
        l.textColor = .lightGray
        
        chartView.animate(xAxisDuration: 0.5, yAxisDuration: 0.2)
        
    }
    
    class Coordinator: NSObject, ChartViewDelegate, AxisValueFormatter {
        var parent: TransactionRadarChartView
        
        init(_ chartView: TransactionRadarChartView) {
            self.parent = chartView
        }
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            
            return parent.viewModel.activities[Int(value) % parent.viewModel.activities.count]
        }
        
    }
}

struct TransactionRadarChartView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRadarChartView(viewModel: RadarChartViewModel())
    }
}
