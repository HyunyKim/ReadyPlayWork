//
//  MainViewModel.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/23.
//

import Foundation

class MainViewModel: ObservableObject {
    
    enum Category: String {
        case Chart = "Chart"
        case Component = "Component"
        case Animation = "Animation"
        
        var list: [SubList] {
            switch self {
            case .Chart:
                return [.LineChart, .BarChart]
            case .Component:
                return [.Alert,.Toast]
            case .Animation:
                return []
            }
        }
    }
    
    enum SubList: Hashable {
        case Alert
        case Toast
        case LineChart
        case BarChart
        
        var title: String {
            switch self {
                
            case .Alert:
                return "Alert"
            case .Toast:
                return "Toast"
            case .LineChart:
                return "LineChart"
            case .BarChart:
                return "BarChart"
            }
        }
    }
    
    let category: [Category] = [.Chart, .Component, .Animation]
}
