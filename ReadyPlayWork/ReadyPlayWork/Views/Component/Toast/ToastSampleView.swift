//
//  ToastSampleView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 11/29/23.
//

import SwiftUI



struct ToastSampleView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showAnimation: Bool = false
    @State private var toastValue: HToastView.ToastValues? = nil
    
    var body: some View {
        VStack(spacing:20, content: {
            Button(action: {
                toastValue = .init(message: "이게 되었으면 좋걷다")
            }, label: {
                Text("Show")
                    .frame(minWidth: 100)
                    .padding(10)
                    .background(.gray)
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 8,bottomLeading: 8, bottomTrailing: 8, topTrailing: 8)))
            })
            .buttonStyle(.plain)
            
            Toggle("Animation On",isOn: $showAnimation)
                .frame(width: 200)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                .background(.gray)
                .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 8,bottomLeading: 8, bottomTrailing: 8, topTrailing: 8)))
        })
        .toast(toastValue: $toastValue)
    }
}
#Preview {
    ToastSampleView()
}
