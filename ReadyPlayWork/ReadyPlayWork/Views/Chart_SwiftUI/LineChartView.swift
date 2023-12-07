//
//  LineChartView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/23.
//

import SwiftUI
import Charts

struct LineChartView: View {
    
    var data: [Stock] = []
    
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
//            .updating($scale) { currentState, pastState, transaction in
//                pastState = currentState
//            }
            
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                Chart(data, id: \.date) { model in
                    
                    LineMark(
                        x: .value("Date", model.date),
                        y: .value("Price", model.price)
                    )
                    .lineStyle(StrokeStyle(lineWidth: 3))
                    .foregroundStyle(.red)
                    .interpolationMethod(.cardinal)
                    .symbol (Circle().strokeBorder(lineWidth: 2))
                    .symbolSize(100)
                }
//                .scaleEffect(scale)
                .gesture(magnification)
                
//                .frame(width: 50 * (CGFloat(data.count)))
                .frame(width: (scale > 1 ? (1 + (scale * 0.2)) : 1) * geometry.size.width)
            }
            .frame(width: geometry.size.width)
        }
        .navigationTitle("SW_LineChart")
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(data: Stock.sampleData())
    }
}
