//
//  SceneRouter.swift
//  ReadyPlayWorkUIKit
//
//  Created by JeongHyun Kim on 2/2/24.
//

import Foundation
import LevelOSLog

final class SceneRouter {
    static let shared: SceneRouter = SceneRouter()
    private init() {
        Log.fault("Do not init Singleton instance")
    }
    let category: [Category] = [ .chart, .component, .utility]

    enum Category: String {
        case chart = "Chart-DGChart"
        case component = "Component"
        case utility = "Utility"
        
        var list: [SubList] {
            switch self {
            case .chart:
                return [.lineChart, .barChart, .radarChart, .pieChart]
            case .component:
                return [.alert, .toast, .photoPicker]
            case .utility:
                return []
            }
        }
    }
    
    enum SubList: Hashable {
        case alert
        case toast
        case lineChart
        case barChart
        case radarChart
        case pieChart
        case photoPicker
        
        var title: String {
            switch self {
                
            case .alert:
                return "Alert"
            case .toast:
                return "Toast"
            case .lineChart:
                return "LineChart"
            case .barChart:
                return "BarChart"
            case .radarChart:
                return "RadarChart"
            case .pieChart:
                return "PieChart"
            case .photoPicker:
                return "PhotoPicker"
            }
        }
    }
    
    enum SceneList {
        case main
        func sceneInstance() -> BaseViewController {
            switch self {
            case .main:
                let viewController = MainViewController.xibInstantiate()
                return viewController
            }
        }
    }
}
