//
//  RadarChartView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/29.
//

import SwiftUI

struct RadarChartView: View {
    var body: some View {
        TransactionRadarChartView(viewModel: RadarChartViewModel())
            .frame(width: 400, height: 600)
        .navigationTitle("RadarChart")
    }
}

struct RadarChartSampleView_Previews: PreviewProvider {
    static var previews: some View {
        RadarChartView()
    }
}
