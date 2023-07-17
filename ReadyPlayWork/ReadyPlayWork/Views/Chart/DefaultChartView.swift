//
//  DefaultChartView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/07/07.
//

import SwiftUI

struct DefaultChartView: View {
    
    let destination: NavigationModel.SubList
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                switch destination {
                    
                case .BarChart:
                    TransactionBarChartView(viewModel: BarChartViewModel())
                case .RadarChart:
                    TransactionRadarChartView(viewModel: RadarChartViewModel())
                case .LineChart:
                    TransactionLineChartView()
                case .PieChart:
                    TransactionPieChartView(viewModel: PieChartViewModel())
                default:
                    TransactionLineChartView()
                }
            } .frame(width: geometry.size.width, height: geometry.size.height)
        }.navigationTitle(destination.title)
        
    }
}

struct DefaultChartView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultChartView(destination: .BarChart)
    }
}
