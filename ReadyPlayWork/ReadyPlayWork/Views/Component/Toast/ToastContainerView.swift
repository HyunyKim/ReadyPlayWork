//
//  ToastContainerView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 11/30/23.
//

import SwiftUI


struct HToastView: View {
    enum ToastPostion {
        case Top
        case Center
        case Bottom
    }
    
    struct ToastValues: Equatable {
        var message: String
        var bgColor: Color = .white
        var fontColor: Color = .gray
        var font: Font = Font.system(size: 12)
        var position: ToastPostion = .Bottom
        var showAnimation: Bool = false
    }
    let toastValue: ToastValues
    
    
    var body: some View {
        VStack(alignment:.center, spacing: 0, content: {
            if toastValue.position == .Bottom  {
                Spacer()
            }
            HStack(spacing: 0, content: {
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundStyle(.blue)
                    .padding(.leading, 10)
                Text(toastValue.message)
                    .font(toastValue.font)
                    .foregroundStyle(toastValue.fontColor)
                    .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 20))
                    
            }).overlay (
                Rectangle()
                    .fill(.blue)
                    .frame(width: 6)
                    .clipped(),alignment: .leading)
//            .frame(width: geometry.size.width / 1.2)
            .background(toastValue.bgColor.opacity(1))
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding([.leading, .trailing], 20)
            .shadow(radius: 4,x: 1, y:1)
            
            if toastValue.position == .Top {
                Spacer()
            }
        })
    }
}


#Preview {
    HToastView(toastValue: HToastView.ToastValues(message: "보여줘라!as;sldkfj"))
}
