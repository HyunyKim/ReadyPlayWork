//
//  ChartMagnificationGestureProtocol.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/07/12.
//

import Foundation
import SwiftUI

protocol ChartMagnificationGestureProtocol {
    var scale: Double { get set }
    var lastScale: Double { get set }
    var magnification: MagnificationGesture { get set }
}
