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
    
    @State private var path = [MainViewModel.SubList]()
    
    var body: some View {
        NavigationStack(path: $path){
            List(self.category, id: \.self) { section in
                Section {
                    ForEach(section.list, id:\.self) { item in
                        Button {
                            path.append(item)
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
            .navigationDestination(for: MainViewModel.SubList.self) { item in
                switch item {
                case .LineChart:
                    LineChartView()
                default:
                    BarChartView()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
