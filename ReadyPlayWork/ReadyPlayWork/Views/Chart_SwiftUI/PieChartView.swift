//
//  PieChartView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/07/13.
//

import SwiftUI

struct PieChartView: View {
    
    let data: [Stock] = Stock.pieData()
    @State var selectedStock: Stock? = nil
    
    var body: some View {
        VStack(spacing: 10) {
            Text(" 이건.... 포기 다음에 도전.")
            Canvas { context, size in
                let dout = Path { p in
                    p.addEllipse(in: CGRect(origin: .zero, size: size))
                    p.addEllipse(in: CGRect(x: size.width * 0.25, y: size.height * 0.25, width: size.width * 0.5, height: size.height * 0.5))
                }
                context.clip(to: dout, style: .init(eoFill: true))
                
                let total = data.map({$0.price}).reduce(0,+)
                context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
                var pieContext = context
                pieContext.rotate(by: .degrees(-90))
                let radius = min(size.width, size.height) * 0.45
//                let gapSize = Angle(degrees: 5) // size of the gap between slices in degrees
                
                var startAngle = Angle.zero + Angle(degrees: 0)
                for stock in data {
                    let angle = Angle(degrees: 360 * (stock.price / total))
                    let endAngle = startAngle + angle
                    let path = Path { p in
                        p.move(to: .zero)
                        p.addArc(center: .zero, radius: radius + (stock.price == (selectedStock?.price ?? 0) ? 20 : 0) , startAngle: startAngle + Angle(degrees: 5) / 2, endAngle: endAngle, clockwise: false)
                        //                    p.addRelativeArc(center: .zero, radius: radius + (stock.price == (selectedStock?.price ?? 0) ? 20 : 0), startAngle: startAngle  / 2, delta: Angle(degrees: 100))
                        p.closeSubpath()
                    }
                    pieContext.fill(path, with: .color(stock.color))
                    startAngle = endAngle
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        print("gesture VAlue - \(value.location)")
                    })
            )
        }
        .navigationTitle("SW_PieChart")
        .onAppear() {
            selectedStock = data.first
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}
