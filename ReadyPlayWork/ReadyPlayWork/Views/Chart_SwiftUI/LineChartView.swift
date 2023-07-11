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
    
    init(value: Bool) {
        for index in 0..<30 {
            data.append(Stock(name: "S전자", date: "\(10 + index)", price: Double.random(in: 500...70000)))
        }
    }
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                Chart(data, id: \.date) { model in
                    LineMark(
                        x: .value("Date", model.date),
                        y: .value("Price", model.price)
                    )
                    .lineStyle(StrokeStyle(lineWidth: 2))
                    .foregroundStyle(.red)
                    .interpolationMethod(.cardinal)
                    .symbolSize(60)
                }
//                .chartXScale(domain: "2001"..."2040")
//                .chartXScale(range: )
//                .scaleEffect(scale)
                .gesture(magnification)
                
//                .modifier(Pinchto)
//                .frame(width: 50 * (CGFloat(data.count)))
                .frame(width: scale * geometry.size.width)
            }
            .frame(width: geometry.size.width)
        }
//        .background(Color.randColor())
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(value: false)
    }
}
