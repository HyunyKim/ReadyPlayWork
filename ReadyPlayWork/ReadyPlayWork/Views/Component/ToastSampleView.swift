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

    var message: String
    var font: Font?
    var bgColor: Color = .black
    var fontColor: Color = .white
    var position: ToastPostion = .Bottom
    
    var body: some View {
//        GeometryReader(content: { geometry in
            VStack(spacing: 0, content: {
                if position == .Bottom {
                    Spacer()
                }
                Text(message)
                    .font(font ?? Font.system(size: 12))
                    .foregroundStyle(fontColor)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(bgColor.opacity(0.5))
                    .clipShape(.rect(cornerSize: CGSize(width: 4, height: 4)))
            
                if position == .Top {
                    Spacer()
                }
            })
    }
    
    mutating func changeMessage(msg: String) {
        self.message = msg
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
    @State private var toastView = ToastView(message: "이곳에 메세지를 자유롭게 써주세요",font: Font.system(size: 18))
    
    var body: some View {
        ZStack {
            VStack(spacing:0, content: {
                Button(action: {
                    self.showProsess(msg: "뭐라고 할래")
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
        self.toastView.changeMessage(msg: msg)
        withAnimation {
            DispatchQueue.main.async {
                self.showToast = true
            }
        }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                withAnimation {
                    self.showToast = false
                }
            })
    }
}
#Preview {
    ToastSampleView()
}
