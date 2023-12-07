//
//  ToastContainerView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 11/30/23.
//

import SwiftUI

protocol ToastMessageProtocol {
    var toastQueue: [ToastView.ToastValues] { get set }
    
    func messagePush(values: ToastView.ToastValues)
    func messagePop() -> Bool
    func existMssage() -> Bool
}
extension ToastMessageProtocol {
    func existMssage() -> Bool {
        guard toastQueue.count > 0 else {
            return false
        }
        return true
    }
}


class ToastViewModel: ObservableObject, ToastMessageProtocol{
    
    @Published var isShowToast: Bool = false
    @Published var currentValues: ToastView.ToastValues? = nil
    
    private var workItem: DispatchWorkItem? = nil
    var toastQueue: [ToastView.ToastValues] = []
    func messagePush(values: ToastView.ToastValues) {
        toastQueue.append(values)
    }
    
    @discardableResult
    func messagePop() -> Bool {
        guard let value = toastQueue.first else {
            self.currentValues = nil
            return false
        }
        self.currentValues = value
        toastQueue.removeFirst()
        
        if value.showAnimation {
            withAnimation(.easeIn) {
                self.isShowToast = true
            }
        }else {
            self.isShowToast = true
        }

        if workItem != nil {
            workItem?.cancel()
            workItem = nil
        }
        workItem = DispatchWorkItem {
            withAnimation(.easeOut) {
                self.isShowToast = false
            }
            if self.existMssage() {
                self.messagePop()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: workItem!)
        return true
    }
}

struct ToastView: View {
    enum ToastPostion {
        case Top
        case Center
        case Bottom
    }
    
    enum DisplayType {
        /// 메세지 순차적으로 보여줌.
        case Sequence
        /// 최신 메세지만 표시함.
        case RightAway
    }
    
    struct ToastValues {
        var message: String
        var bgColor: Color = .black
        let fontColor: Color = .white
        let font: Font = Font.system(size: 12)
        let position: ToastPostion = .Bottom
        let showAnimation: Bool = false
    }
    /// Toast Display Type ( Sequence / Right Away)
    let displayType: DisplayType
    @ObservedObject private var viewModel: ToastViewModel = ToastViewModel()
    
    var body: some View {
        VStack(spacing: 0, content: {
            if viewModel.isShowToast == true, let values = viewModel.currentValues {
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
            }
        })
    }
    
    func showToast(values: ToastView.ToastValues) {
        viewModel.messagePush(values: values)
        nextMessage()
    }

    private func nextMessage() {
        if displayType == .Sequence {
            guard  viewModel.isShowToast == false else {
                return
            }
        } else {
            self.viewModel.isShowToast = false
        }
        viewModel.messagePop()
    }
}
