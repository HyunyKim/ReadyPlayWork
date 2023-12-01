//
//  ToastSampleView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 11/29/23.
//

import SwiftUI



struct ToastSampleView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isShowToast: Bool = false
    @State private var toastContainer: ToastContainerView = ToastContainerView(isShowToast: .constant(false))
    
    var body: some View {
        ZStack {
            VStack(spacing:0, content: {
                Button(action: {
                    self.showProsess(msg: "뭐라고 할래 좀 길게 말할까?")
                }, label: {
                    Text("Show")
                        .frame(minWidth: 100)
                        .padding(10)
                        .background(.gray)
                        .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 8,bottomLeading: 8, bottomTrailing: 8, topTrailing: 8)))
                })
                .buttonStyle(.plain)
            })
            
            VStack(spacing: 0, content: {
                    self.toastContainer
                    .id(isShowToast)
            })
        }
        .onAppear() {
            self.toastContainer.isShowToast = self.isShowToast
        }
    }
    
    private func showProsess(msg: String) {
        /// Toast UI Setting
        let values = ToastView.ToastValues(message: msg, bgColor: colorScheme == .dark ? .white : .black)
        self.toastContainer.showToast(values: values)
        self.isShowToast = true
    }
}
#Preview {
    ToastSampleView()
}
