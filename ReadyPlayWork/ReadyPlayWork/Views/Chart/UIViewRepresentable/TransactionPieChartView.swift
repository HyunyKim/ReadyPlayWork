//
//  TransactionPieChartView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/07/13.
//

import Foundation
import SwiftUI
import UIKit
import DGCharts

struct TransactionPieChartView: UIViewRepresentable {
    
    let viewModel: PieChartViewModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> DGCharts.PieChartView {
        let view = DGCharts.PieChartView()
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ chartView: DGCharts.PieChartView, context: Context) {
        
        let chartData = viewModel.pieChartData()
        chartView.data = chartData
        
        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
        
        // Value를 밖으로 빼기 위한 옵션.
//        chartView.legend.enabled = false
//        chartView.setExtraOffsets(left: 20, top: 0, right: 20, bottom: 0)
        
        chartView.entryLabelColor = .white
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .bold)
        
        chartView.animate(xAxisDuration: 1.5, easingOption: .easeOutBack)
    }

    class Coordinator: NSObject, ChartViewDelegate {
        var parent: TransactionPieChartView
        
        init(_ parent: TransactionPieChartView) {
            self.parent = parent
        }
        
//        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
//
//            return parent.viewModel.activities[Int(value) % parent.viewModel.activities.count]
//        }
        
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

struct TransactionPieChartView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionPieChartView(viewModel: PieChartViewModel())
    }
}

