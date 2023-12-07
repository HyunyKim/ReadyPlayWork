//
//  ToastSampleView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 11/29/23.
//

import SwiftUI



struct ToastSampleView: View {
    @Environment(\.colorScheme) var colorScheme
    private var toastView: ToastView = ToastView(displayType: .RightAway)
    private var messageList: [String] = ["테스트 메세지",
                                         "Test Message ",
                                         "긴 메세지 테스트를 합니다.\n 두줄로 표시됩니다.",
                                         "배경색도 원하는데로 바꿔 보세요",
                                         "다른 곳에서도 이걸 활용해서 보여주세요",
                                         "전체에 적용되도록 만들고 싶었습니다",
                                         "다른 프로젝트에서 적용해서 사용해보겠습니다\n연속된 메시지\n순차적 메세지\n"
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
