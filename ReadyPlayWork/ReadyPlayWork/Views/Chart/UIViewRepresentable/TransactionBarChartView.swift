//
//  TransactionBarChartView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/07/06.
//

import Foundation
import DGCharts
import UIKit
import SwiftUI

struct TransactionBarChartView: UIViewRepresentable {

    let viewModel : BarChartViewModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> DGCharts.BarChartView {
        let view = DGCharts.BarChartView()
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ chartView: DGCharts.BarChartView, context: Context) {
        
        let data = viewModel.barChartDatas()
        chartView.data = data
        
        let marker = RadarMarkerView(frame: CGRect(x: 0, y: 0, width: 80, height: 50))
        marker.chartView = chartView
        chartView.marker = marker
    }
    
    class Coordinator: NSObject, ChartViewDelegate {
        
        var parent: TransactionBarChartView
        
        init(_ chartView: TransactionBarChartView) {
            self.parent = chartView
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
    
    struct TransactionBarChartView_Preview: PreviewProvider {
        
        static var previews: some View {
            TransactionBarChartView(viewModel: BarChartViewModel())
        }
    }
}
