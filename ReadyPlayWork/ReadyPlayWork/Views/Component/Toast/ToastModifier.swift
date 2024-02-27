//
//  ToastModifier.swift
//  ReadyPlayWork
//
//  Created by JeongHyun Kim on 2/27/24.
//

import Foundation
import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var toastValue: HToastView.ToastValues?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainToastView()
                        .offset(y: -10)
                }.animation(.spring(), value: toastValue)
            )
            .onChange(of: toastValue) { value in
                showToast()
            }
    }
    
    @ViewBuilder func mainToastView() -> some View {
        if let values = toastValue {
            HToastView(toastValue: values)
                .transition(.move(edge: values.position == .Bottom ?  .bottom : .top))
        }
    }
    
    private func showToast() {
        guard toastValue != nil else { return }
        
        workItem?.cancel()
        let task = DispatchWorkItem {
            dismissToast()
        }
        
        workItem = task
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: task)
    }
    
    private func dismissToast() {
        withAnimation {
            toastValue = nil
        }
        workItem?.cancel()
        workItem = nil
    }
    
}

extension View {
    func toast(toastValue: Binding<HToastView.ToastValues?>) -> some View {
        self.modifier(ToastModifier(toastValue: toastValue))
    }
}
