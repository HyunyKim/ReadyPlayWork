//
//  ContentView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var router: NavigationModel = NavigationModel()
    
    var category: [NavigationModel.Category]  {
        return self.router.category
    }
    
    @State private var path = [NavigationModel.SubList]()
    
    var body: some View {
        NavigationStack(path: $router.navPath){
            List(self.category, id: \.self) { section in
                Section {
                    ForEach(section.list, id:\.self) { item in
                        Button {
                            router.navPath.append(item)
                        } label: {
                            Label(item.title, systemImage: "circle")
                                .foregroundColor(.gray)
                        }.buttonStyle(.borderless)

                    }
                } header: {
                    Text(section.rawValue)
                        .textCase(nil)
                }
            }
            .navigationTitle("Category")
            .navigationDestination(for: NavigationModel.SubList.self) { item in
                item.destination
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
