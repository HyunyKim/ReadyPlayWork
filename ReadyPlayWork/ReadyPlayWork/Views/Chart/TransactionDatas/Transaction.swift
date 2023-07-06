//
//  Transaction.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/29.
//

import Foundation
import UIKit
import DGCharts

struct RadarChartViewModel {
    let activities = ["Burger", "Steak", "Salad", "Pasta", "Pizza"]

    func radarChartDatas() -> RadarChartData {
        let mult: UInt32 = 200
        let min: UInt32 = 0
        let cnt = 5
        
        let block: (Int) -> RadarChartDataEntry = { _ in return RadarChartDataEntry(value: Double(arc4random_uniform(mult) + min))}
//        let entries1 = (0..<cnt).map(block)
        let entries1 = [RadarChartDataEntry(value: 26),
                        RadarChartDataEntry(value: 20),
                        RadarChartDataEntry(value: 30),
                        RadarChartDataEntry(value: 40),
                        RadarChartDataEntry(value: 50)]
//        let entries2 = (0..<cnt).map(block)
        
        let set1 = RadarChartDataSet(entries: entries1, label: "MyTest")
        set1.setColor(UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1))
        set1.fillColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        set1.drawFilledEnabled = true
        set1.fillAlpha = 0.7
        set1.lineWidth = 2
        set1.drawHighlightCircleEnabled = true
        set1.setDrawHighlightIndicators(false)
        set1.highlightCircleFillColor = .blue
        set1.highlightColor = .black
        set1.highlightCircleInnerRadius = 3.0
        set1.highlightCircleOuterRadius = 4.0
        set1.highlightCircleStrokeColor = .red
        
//        let set2 = RadarChartDataSet(entries: entries2, label: "This Week")
//        set2.setColor(UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1))
//        set2.fillColor = UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1)
//        set2.drawFilledEnabled = true
//        set2.fillAlpha = 0.7
//        set2.lineWidth = 2
//        set2.drawHighlightCircleEnabled = true
//        set2.setDrawHighlightIndicators(false)
        
//        let data: RadarChartData = [set1, set2]
        let data: RadarChartData = [set1]
        data.setValueFont(.systemFont(ofSize: 8, weight: .light))
        data.setDrawValues(false)
        data.setValueTextColor(.white)
        
        
        return data
    }
}


struct BarChartViewModel {
    
    func barChartDatas() -> BarChartData {
        let yVals = (1..<5).map { (i) -> BarChartDataEntry in
            let mult = 40
            let val = Double(arc4random_uniform(UInt32(mult)))
            if arc4random_uniform(100) < 25 {
                return BarChartDataEntry(x: Double(i), y: val, icon: UIImage.init(systemName: "PlayStation"))
            } else {
                return BarChartDataEntry(x: Double(i), y: val)
            }
        }
        
        let set1: BarChartDataSet = BarChartDataSet(entries: yVals, label: "The year 2017")
        set1.colors = ChartColorTemplates.material()
        
        let data = BarChartData(dataSet: set1)
        data.setValueFont(.systemFont(ofSize: 10,weight: .light))
        data.barWidth = 0.9
        return data
        
    }
}
