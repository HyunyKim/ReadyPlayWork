//
//  ContentView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: NavigationModel
    
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
                            GeometryReader { localGeometry in
                                HStack(spacing: 0) {
                                    Label(item.title, systemImage: "circle.circle")
                                        .foregroundColor(.gray)
                                        Spacer()
                                }.frame(width: localGeometry.size.width,
                                        height: localGeometry.size.height)
                            }
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
            .environmentObject(NavigationModel())
    }
}
