//
//  Extension.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/28.
//

import Foundation
import SwiftUI

extension Color {
    static func randColor() -> Color {
        return Color(red: CGFloat.random(in: (0...256)) / 255.0,
                     green: CGFloat.random(in: (0...256)) / 255.0,
                     blue: CGFloat.random(in: (0...256)) / 255.0)
    }
}


extension Date {
    func getTimeStringByFormatter(format: String = "HHmmss") -> String{
        Abbr.dateFormatter.dateFormat = format
        return Abbr.dateFormatter.string(from: self)
    }
    
    func offsetDate(component: Calendar.Component,offset: Int, format:String = "yyyy.MM") -> Date {
        guard let newDate = Calendar.current.date(byAdding: component, value: offset, to: self) else {
            return self
        }
        Abbr.dateFormatter.dateFormat = format
        let string = Abbr.dateFormatter.string(from: newDate)
        return Abbr.dateFormatter.date(from: string) ?? self
    }
}


class Abbr: NSObject {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone.current
        return formatter
    }()
}
