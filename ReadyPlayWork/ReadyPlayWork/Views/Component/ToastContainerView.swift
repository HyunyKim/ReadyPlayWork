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
    
    private var timer: Timer? = nil
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
        
        withAnimation(.easeIn) {
            self.isShowToast = true
        }
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in
            withAnimation(.easeOut) {
                self.isShowToast = false
            }
            if self.existMssage() {
                self.messagePop()
            }
        })
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
        case Sequence
        case RightAway
    }
    
    struct ToastValues {
        var message: String
        var bgColor: Color = .black
        let fontColor: Color = .white
        let font: Font = Font.system(size: 12)
        let position: ToastPostion = .Bottom
    }
    
    
    private let displayType: DisplayType = .Sequence
    
    @State private var timer: Timer? = nil
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
