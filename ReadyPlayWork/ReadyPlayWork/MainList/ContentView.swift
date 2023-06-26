//
//  ContentView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/23.
//

import SwiftUI

struct ContentView: View {
    var viewModel: MainViewModel = MainViewModel()
    
    var category: [MainViewModel.Category]  {
        return self.viewModel.category
    }
    
    var body: some View {
        NavigationStack {
            List(self.category, id: \.self) { section in
                Section {
                    ForEach(section.list, id:\.self) { item in
                        NavigationLink(value: item) {
                            Label(item.title, systemImage: "xbox.logo")
                                .foregroundColor(.gray)
                        }
                    }
                } header: {
                    Text(section.rawValue)
                        .textCase(nil)
                }
            }
            .navigationTitle("Category")
            .navigationDestination(for: MainViewModel.SubList.self) { item in
                LineChartView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
