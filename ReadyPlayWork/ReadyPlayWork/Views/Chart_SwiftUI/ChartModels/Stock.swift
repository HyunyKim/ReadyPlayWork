//
//  Stock.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/07/10.
//

import Foundation

struct Stock {
    let name: String
    let date: Date
    let price: Double
    
    static func date(year: Int, month: Int, day: Int = 1, hour: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        Calendar.current.date(from: DateComponents(year: year, month: month, day: day, hour: hour, minute: minutes, second: seconds)) ?? Date()
    }
    
    static func sampleData(isSmall: Bool = false) -> [Stock] {
        if isSmall {
            return [
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
        ]
    }
}
