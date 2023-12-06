//
//  ToastSampleView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 11/29/23.
//

import SwiftUI



struct ToastSampleView: View {
    @Environment(\.colorScheme) var colorScheme
    private var toastView: ToastView = ToastView()
    @State private var updateUI: Bool = false
    private var messageList: [String] = ["어떤 메세지를 원하십니까?",
                                         "오늘은 어제 보다 많이 춥군요",
                                         "하루하루가 쉽지가 않습니다",
                                         "그래도 잘 지내시기 바랍니다",
                                         "슬슳 칼바람도 지겨워 지네요",
                                         "그럼 어디 랭크 게임을 해볼까요?",
                                         "긴 메세지를 어떻게 보여주나요.\n 보여줘 봅시다."
    ]
    
    var body: some View {
        ZStack {
            VStack(spacing:0, content: {
                Button(action: {
                    self.showProsess(msg: messageList[Int.random(in: 0...5)])
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
                self.toastView
            })
        }
    }
    
    private func showProsess(msg: String) {
        /// Toast UI Setting
        let values = ToastView.ToastValues(message: msg, bgColor: colorScheme == .dark ? .white : .black)
        toastView.showToast(values: values)
    }
}
#Preview {
    ToastSampleView()
}
