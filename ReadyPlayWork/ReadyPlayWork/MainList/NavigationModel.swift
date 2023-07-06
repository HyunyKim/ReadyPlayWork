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
        
        var list: [SubList] {
            switch self {
            case .Chart:
                return [.LineChart, .BarChart, .RadarChart]
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
        case BarChart
        case RadarChart
        case AppStorage
        case SceneStorage
        case State
        
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
            case .RadarChart:
                return "RadarChart"
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
            case .LineChart:
                LineChartView()
            case .RadarChart:
                RadarChartView()
            case .State:
                StateView()
            case .BarChart:
                BarChartView()
            case .Alert:
                LineChartView()
            case .Toast:
                LineChartView()

            }
        }
        
        
    }
    
    let category: [Category] = [.Property, .Chart, .Component, .Animation]
    @Published var navPath: NavigationPath = .init()
}
