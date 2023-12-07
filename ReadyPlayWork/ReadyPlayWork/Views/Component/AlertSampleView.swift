//
//  AlertSampleView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 2023/07/18.
//

import SwiftUI

struct AlertSampleView: View {
    
    enum AlertType {
        case OneButton
        case TwoButton
        case MultiButton
        
        var title: String {
            switch self {
                
            case .OneButton:
                return "One Button Type"
            case .TwoButton:
                return "Two Button Type"
            case .MultiButton:
                return "Multi button type"
            }
        }
        
        var message: String {
            switch self {
                
            case .OneButton:
                return "내용을 확인합니다."
            case .TwoButton:
                return "진행하시겠습니까?"
            case .MultiButton:
                return "선택해 주세요."
            }
        }
    }
    
    @State private var showAlert = false
    @State private var alertType: AlertType = .OneButton
    
    @State private var customAlert = false
    
    var body: some View {
        VStack(spacing: 10) {
            Group {
                Button(role: .none) {
                    alertType = .OneButton
                    showAlert = true
                } label: {
                    Label("Type 1", systemImage: "exclamationmark.bubble")
                }
                Button(role: .none) {
                    alertType = .TwoButton
                    showAlert = true
                } label: {
                    Label("Type 2", systemImage: "exclamationmark.bubble")
                }
                Button(role: .none) {
                    alertType = .MultiButton
                    showAlert = true
                } label: {
                    Label("Type 3", systemImage: "exclamationmark.bubble")
                }
                Button(role: .none) {
                    customAlert = true
                } label: {
                    Label("OtherType", systemImage: "exclamationmark.bubble")
                }
            }
            .foregroundColor(.white)
            .buttonStyle(.borderedProminent)
                  
        }
        .navigationTitle("Alert Sample")
        .alert(alertType.title, isPresented: $showAlert, presenting: alertType , actions: { type in
            switch type {
            case .OneButton:
                Button("확인") {}
            case .TwoButton:
                Button("확인") {}
                Button("취소", role: .cancel) {}
            case .MultiButton:
                Button("선택1") {}
                Button("선택2", role: .destructive) {}
                Button("선택3") {}
                Button("취소", role: .cancel) {}
            }
        }) { type in
            Text(type.message)
        }
        
        .alert(isPresented: $customAlert) {
            Alert(title: Text("다른 방식"),
                  message: Text("크기 바꾸고 싶다고!"),
                  primaryButton: .cancel(Text("취소"), action: {
                
            }), secondaryButton: .default(Text("해보자"), action: {
                
            }))
        }
    }
}

struct AlertSampleView_Previews: PreviewProvider {
    static var previews: some View {
        AlertSampleView()
    }
}
