//
//  BarChartView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/26.
//

import SwiftUI
import Charts

struct BarChartView: View {
    
    enum BarChartType {
        case SingleBar
        case DoubleBar
    }
    
    var data: [Stock] = []
    var data2: [StockType2] = StockType2.sampleData
    
    var xValueCount: CGFloat {
        guard let stock = data2.last else {
            return 12
        }
        return CGFloat(stock.data.count)
    }
    
    @State var chartType: BarChartType = .DoubleBar
    
    @State var scale = 1.0
    @State var lastScale = 1.0
    
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { state in
                let delta = state / lastScale
                scale *= delta
                lastScale = state
            }
            .onEnded { state in
                lastScale = 1.0
                if state < 1 {
                    scale = 1.0
                }
                print("Scale - \(scale)")
            }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    Spacer()
                    Button {
                        chartType = .SingleBar
                    } label: {
                        Text("Single Bar")
                            .foregroundColor(chartType == .SingleBar ? .blue : .gray)
                    }
                    .tint(chartType == .SingleBar ? .purple : .secondary)
                    .buttonStyle(.bordered)
                    Button {
                        chartType = .DoubleBar
                    } label: {
                        Text("Duble Bar")
                            .foregroundColor(chartType == .DoubleBar ? .blue : .gray)
                    }
                    .tint(chartType == .DoubleBar ? .purple : .secondary)
                    .buttonStyle(.bordered)
                    Spacer().frame(width:0)
                }
                ScrollView(.horizontal) {
                    if chartType == .SingleBar {
                        singleChart(geometry: geometry)
                    }else {
                        doubleBarChart(geometry: geometry)
                    }
       
                }
            }
            .frame(width: geometry.size.width)
        }
    }
    
    private func singleChart(geometry: GeometryProxy) -> some View {
        Chart(data,id:\.date) { stock in
            Plot {
                BarMark(
                    x: .value("Day", stock.date),
                    y: .value("Price", stock.price),
                    width: 30
                )
            }.foregroundStyle(.red)
        }
        .gesture(magnification)
        .frame(width: (scale > 1 ? (1 + (scale * 0.2)) : 1) * geometry.size.width)
    }
    
    private func doubleBarChart(geometry: GeometryProxy) -> some View {
        Chart(data2) { stock in
            ForEach(stock.data, id: \.date) { info in
                Plot {
                    BarMark(
                        x: .value("Date", info.date, unit: .month),
                        y: .value("Sales", info.price),
                        width: 13
                    )
                    .foregroundStyle(by: .value("name", stock.name))
                }
                .accessibilityLabel("\(stock.name) \(info.date.weekdayString)")
                .accessibilityValue("\(info.price)")
            }
            .symbol(by: .value("Name", stock.name))
            .interpolationMethod(.catmullRom)
            .position(by: .value("dd", stock.name))
//            .position(by: .value("City", showBarsStacked ? "Common" : series.city))
        }
        .chartLegend(.visible)
        .chartLegend(position: .top)
        .gesture(magnification)
        .frame(width: (scale > 1 ? (1 + (scale * 0.2)) : 1) * (50 * xValueCount))    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(data: Stock.sampleData(isSmall: true))
    }
}
