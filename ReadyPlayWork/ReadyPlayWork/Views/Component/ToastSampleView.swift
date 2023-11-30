//
//  ToastSampleView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 11/29/23.
//

import SwiftUI

struct ToastView: View {
    enum ToastPostion {
        case Top
        case Center
        case Bottom
    }
    struct ToastValues {
        let message: String
        var bgColor: Color = .black
        let fontColor: Color = .white
        let font: Font = Font.system(size: 12)
        let position: ToastPostion = .Bottom
    }

    var values: ToastValues = ToastValues(message: "TestMessage")
    
    var body: some View {
//        GeometryReader(content: { geometry in
            VStack(spacing: 0, content: {
                if values.position == .Bottom  {
                    Spacer()
                }
                Text(values.message)
                    .font(values.font)
                    .foregroundStyle(values.fontColor)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(values.bgColor.opacity(0.5))
                    .clipShape(.rect(cornerSize: CGSize(width: 4, height: 4)))
            
                if values.position == .Top {
                    Spacer()
                }
            })
    }
    
    mutating func changeMessage(values: ToastValues) {
        self.values = values
    }
}

struct ToastContainerView: View {
    var body : some View {
        VStack(spacing: 0, content: {
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
        })
    }
}

struct ToastSampleView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showToast: Bool = false
    @State private var toastView = ToastView()
    
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
                if showToast {
                    self.toastView
                }
            })
        }
    }

    private func showProsess(msg: String) {
        guard showToast == false else {
            return
        }
        /// Toast UI Setting
        let values = ToastView.ToastValues(message: msg, bgColor: colorScheme == .dark ? .white : .black)
        self.toastView.changeMessage(values: values)
        
        withAnimation(.easeIn) {
            self.showToast = true
        }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                withAnimation(.easeInOut) {
                    self.showToast = false
                }
            })
    }
}
#Preview {
    ToastSampleView()
}
