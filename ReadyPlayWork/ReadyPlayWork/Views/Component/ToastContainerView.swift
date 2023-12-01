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
    func messagePop() -> ToastView.ToastValues?
}


class ToastViewModel: ObservableObject, ToastMessageProtocol{
    
    var toastQueue: [ToastView.ToastValues] = []
    var currentValues: ToastView.ToastValues? = nil
    func messagePush(values: ToastView.ToastValues) {
        toastQueue.append(values)
    }
    
    func messagePop() -> ToastView.ToastValues? {
        guard let value = toastQueue.first else {
            return nil
        }
        self.currentValues = value
        toastQueue.removeFirst()
        return value
    }
}

struct ToastView: View {
    enum ToastPostion {
        case Top
        case Center
        case Bottom
    }
    struct ToastValues {
        var message: String
        var bgColor: Color = .black
        let fontColor: Color = .white
        let font: Font = Font.system(size: 12)
        let position: ToastPostion = .Bottom
    }
    
    
    var values: ToastValues
    
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
    
//    func changeMessage(values: ToastValues) {
//        self.values = values
//        print("value - ",self.values.message,values.message)
//    }
}





struct ToastContainerView: View {
    
//    private var toastView = ToastView()
    @Binding var isShowToast: Bool
    @State private var toastValues: ToastView.ToastValues? = nil
    @ObservedObject private var viewModel: ToastViewModel = ToastViewModel()
    
    var body : some View {
        VStack(spacing: 0, content: {
//            if self.isShowToast {
                if let values = self.viewModel.currentValues {
                    ToastView(values: values)
                }
//            }
        })
    }
    
    func showToast(values: ToastView.ToastValues) {
        viewModel.messagePush(values: values)
//        self.isShowToast = true
        nextMessage()
    }
    
    private func nextMessage() {
//        guard self.isShowToast == false else {
//            return
//        }
        let _ = viewModel.messagePop()
//        self.toastValues = values
//        self.toastView.changeMessage(values: values)

        withAnimation(.easeIn) {
            self.isShowToast = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            withAnimation(.easeInOut) {
                self.isShowToast = false
            }
        })
    }
}

#Preview {
    ToastContainerView(isShowToast: .constant(false))
}
