//
//  ReadyPlayWorkApp.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/23.
//

import SwiftUI
@main
struct ReadyPlayWorkApp: App {
    @StateObject var router: NavigationModel = NavigationModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
