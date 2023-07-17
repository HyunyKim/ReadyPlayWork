//
//  NavigationModel.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/23.
//

import Foundation
import SwiftUI

final class NavigationModel: ObservableObject {
    
    enum Category: String {
        case Chart = "Chart-DGChart"
        case Component = "Component"
        case Animation = "Animation"
        case Property = "Peoperty"
        case Chart_SwiftUI = "Chart-SwiftUI"
        
        var list: [SubList] {
            switch self {
            case .Chart:
                return [.LineChart, .BarChart, .RadarChart, .PieChart]
            case .Chart_SwiftUI:
                return [.LineChart_SW, .BarChart_SW, .RadarChart_SW, .PieChart_SW]
            case .Component:
                return [.Alert,.Toast]
            case .Animation:
                return []
            case .Property:
                return [.State, .SceneStorage,.AppStorage]
            }
        }
    }
    
    enum SubList: Hashable {
        case Alert
        case Toast
        case LineChart
        case LineChart_SW
        case BarChart
        case BarChart_SW
        case RadarChart
        case RadarChart_SW
        case PieChart
        case PieChart_SW
        case AppStorage
        case SceneStorage
        case State
        
        var title: String {
            switch self {
                
            case .Alert:
                return "Alert"
            case .Toast:
                return "Toast"
            case .LineChart, .LineChart_SW:
                return "LineChart"
            case .BarChart, .BarChart_SW:
                return "BarChart"
            case .RadarChart, .RadarChart_SW:
                return "RadarChart"
            case .PieChart, .PieChart_SW:
                return "PieChart"
            case .AppStorage:
                return "AppStorage"
            case .SceneStorage:
                return "SceneStorage"
            case .State:
                return "State"
            }
        }
        
        
        @ViewBuilder
        var destination: some View {
            switch self {
            case .AppStorage:
                AppStorageView()
            case .SceneStorage:
                SceneStorageView()
            case .LineChart_SW:
                LineChartView(data: Stock.sampleData())
            case .LineChart, .BarChart, .RadarChart, .PieChart:
                DefaultChartView(destination: self)
            case .RadarChart_SW:
                RadarChartView()
            case .BarChart_SW:
                BarChartView(data: Stock.sampleData(isSmall: true))
            case .PieChart_SW:
                PieChartView()
            case .State:
                StateView()
            case .Alert:
                LineChartView(data: Stock.sampleData())
            case .Toast:
                LineChartView(data: Stock.sampleData())

            }
        }
        
        
    }
    
    let category: [Category] = [.Property, .Chart, .Chart_SwiftUI, .Component, .Animation]
    @Published var navPath: NavigationPath = .init()
}
