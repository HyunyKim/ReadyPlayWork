//
//  AppStorageView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/06/28.
//

import SwiftUI

struct AppStorageView: View {
    
    @AppStorage("AppNumber1") private var number1: Int = 1
    
    @State private var color1: Color = .red
    
    var body: some View {
        VStack(spacing: 0, content: {
            
                ZStack() {
                    Circle()
                        .fill(color1)
                        .frame(width: 200)
                    Text("\(number1)")
                        .font(Font.system(size: 50))
                        .bold()
                        .padding(.top, 10)
                }
            Spacer().frame(height: 50)
            HStack(spacing: 50) {
                Group {
                    HStack(spacing: 10, content: {
                        Button {
                            number1 = Int.random(in: (0...999))
                            } label: {
                                Label("Number", systemImage: "shuffle")
                                    .frame(width:100, height: 44)
                        }
                        Button {
                            color1 = Color.randColor()
                            } label: {
                                Label("Color", systemImage: "shuffle")
                                    .frame(width:100, height: 44)
                            }
                    })
                }
                .buttonStyle(.borderedProminent)
                .foregroundColor(.white)
                .tint(.blue)
                 
            }
        })
//        .frame(height: 400)
        
        .navigationTitle("State View")
    }
}

struct AppStorageView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageView()
    }
}
