//
//  BarChartView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/26.
//

import SwiftUI

struct BarChartView: View {
    var body: some View {
        TransactionBarChartView(viewModel: BarChartViewModel())
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
