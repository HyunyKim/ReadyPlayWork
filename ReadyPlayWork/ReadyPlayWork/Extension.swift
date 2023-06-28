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
