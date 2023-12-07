//
//  Stock.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/07/10.
//

import Foundation
import SwiftUI

struct Stock {
    let name: String
    let date: Date
    let price: Double
    var color: Color = .red
    
    static func date(year: Int, month: Int, day: Int = 1, hour: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        Calendar.current.date(from: DateComponents(year: year, month: month, day: day, hour: hour, minute: minutes, second: seconds)) ?? Date()
    }
    
    static func pieData() -> [Stock] {
        return [
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 01), price: 500, color: .orange),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 02), price: 310, color: .yellow),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 03), price: 150, color: .orange),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 04), price: 250, color: .green),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 05), price: 330, color: .blue),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 06), price: 700, color: .indigo),
        ]
    }
    
    static func sampleData(isSmall: Bool = false) -> [Stock] {
        if isSmall {
            return [
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 01), price: 5000, color: .orange),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 02), price: 3000, color: .yellow),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 03), price: 15000, color: .orange),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 04), price: 25000, color: .green),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 05), price: 53000, color: .blue),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 06), price: 10000, color: .indigo),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 07), price: 9000, color: .purple),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 08), price: 15000, color: .black),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 09), price: 75000, color: .cyan),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 10), price: 25000, color: .gray),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 11), price: 25000, color: .brown),
                Stock(name: "S전자", date: Stock.date(year: 2023, month: 12), price: 25000, color: .mint),
            ]
        }
        return [
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 01), price: 5000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 02), price: 3000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 03), price: 15000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 04), price: 25000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 05), price: 53000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 06), price: 10000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 07), price: 9000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 08), price: 15000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 09), price: 75000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 10), price: 25000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 11), price: 25000),
            Stock(name: "S전자", date: Stock.date(year: 2022, month: 12), price: 25000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 01), price: 5000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 02), price: 3000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 03), price: 15000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 04), price: 25000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 05), price: 53000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 06), price: 10000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 07), price: 9000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 08), price: 15000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 09), price: 75000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 10), price: 25000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 11), price: 25000),
            Stock(name: "S전자", date: Stock.date(year: 2023, month: 12), price: 25000)
        ]
    }
    static func sample2Year() -> [[Stock]] {
        return [
            [
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 01), price: 5000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 02), price: 3000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 03), price: 15000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 04), price: 25000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 05), price: 53000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 06), price: 10000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 07), price: 9000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 08), price: 15000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 09), price: 75000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 10), price: 25000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 11), price: 25000),
                Stock(name: "S전자", date: Stock.date(year: 2022, month: 12), price: 25000)
            ],
            [
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 01), price: 15000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 02), price: 2000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 03), price: 14000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 04), price: 25000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 05), price: 43000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 06), price: 10000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 07), price: 9000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 08), price: 5000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 09), price: 35000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 10), price: 15000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 11), price: 10000),
                Stock(name: "LG전자", date: Stock.date(year: 2022, month: 12), price: 15000)
            ]
        ]
    }
}


struct StockType2: Identifiable {
    let name: String
    let data: [(date: Date, price: Double)]
    var id: String { name }
    
    static let sampleData: [StockType2] = [
        .init(name: "삼성전자", data: [
            (date: Stock.date(year: 2022, month: 01), price: 100),
            (date: Stock.date(year: 2022, month: 02), price: 200),
            (date: Stock.date(year: 2022, month: 03), price: 300),
            (date: Stock.date(year: 2022, month: 04), price: 400),
            (date: Stock.date(year: 2022, month: 05), price: 200),
            (date: Stock.date(year: 2022, month: 06), price: 430),
            (date: Stock.date(year: 2022, month: 07), price: 150),
            (date: Stock.date(year: 2022, month: 08), price: 240),
            (date: Stock.date(year: 2022, month: 09), price: 520),
            (date: Stock.date(year: 2022, month: 10), price: 250),
            (date: Stock.date(year: 2022, month: 11), price: 100),
            (date: Stock.date(year: 2022, month: 12), price: 600)
        ]),
        .init(name: "LG전자", data: [
            (date: Stock.date(year: 2022, month: 01), price: 420),
            (date: Stock.date(year: 2022, month: 02), price: 130),
            (date: Stock.date(year: 2022, month: 03), price: 200),
            (date: Stock.date(year: 2022, month: 04), price: 200),
            (date: Stock.date(year: 2022, month: 05), price: 550),
            (date: Stock.date(year: 2022, month: 06), price: 385),
            (date: Stock.date(year: 2022, month: 07), price: 250),
            (date: Stock.date(year: 2022, month: 08), price: 340),
            (date: Stock.date(year: 2022, month: 09), price: 220),
            (date: Stock.date(year: 2022, month: 10), price: 450),
            (date: Stock.date(year: 2022, month: 11), price: 520),
            (date: Stock.date(year: 2022, month: 12), price: 250)
        ])
    ]
}

struct StockPie {
    
}

extension Date {
    // Used for charts where the day of the week is used: visually  M/T/W etc
    // (but we want VoiceOver to read out the full day)
    var weekdayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"

        return formatter.string(from: self)
    }
    
    var monthString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"

        return formatter.string(from: self)
    }
}
