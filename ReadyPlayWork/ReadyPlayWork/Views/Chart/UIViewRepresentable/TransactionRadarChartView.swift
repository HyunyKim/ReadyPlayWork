//
//  TransactionRadarChartView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/29.
//

import SwiftUI
import DGCharts
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
        
        let marker = RadarMarkerView(frame: CGRect(x: 0, y: 0, width: 80, height: 60))
        marker.chartView = chartView
        chartView.marker = marker
        
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
        
        // TODO: Cannot override from extensions
        //extension DemoBaseViewController: ChartViewDelegate {
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            NSLog("chartValueSelected - \(entry), \(highlight)");
        }
        
        func chartValueNothingSelected(_ chartView: ChartViewBase) {
            NSLog("chartValueNothingSelected");
        }
        
        func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {
            
        }
        
        func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {
            
        }
        
    }
}

struct TransactionRadarChartView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRadarChartView(viewModel: RadarChartViewModel())
    }
}


class RadarMarkerView: MarkerView {
    
    var valueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.offset.x = -self.frame.size.width / 2.0
        self.offset.y = -self.frame.size.height - 7.0
        self.backgroundColor = .clear
        
        valueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        valueLabel.text = "test"
        valueLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        valueLabel.center = CGPoint(x: (frame.size.width / 2), y: (frame.size.height / 2) - 10)
        valueLabel.textAlignment = .center
        self.addSubview(valueLabel)
    }
    
    override func refreshContent(entry: ChartDataEntry, highlight: Highlight) {
        print("marker receive entry - \(entry)")
        valueLabel.text = "\(entry.y)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.maxY))
        
        
        context.closePath()
        
        context.setFillColor(UIColor.blue.withAlphaComponent(0.5).cgColor)
        context.fillPath()
    }
}
