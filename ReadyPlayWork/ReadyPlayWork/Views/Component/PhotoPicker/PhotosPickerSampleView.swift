//
//  PhotosPickerSampleView.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 12/7/23.
//

import SwiftUI
import PhotosUI

struct ImportImage: View {
    let imageState: PhotosPickerViewModel.ImageState
    
    var body: some View {
        switch imageState {
        case .empty:
            Image(systemName: "person")
                .font(.system(size: 40))
                .foregroundStyle(.white)
        case .loading:
            ProgressView()
        case .success(let image):
            image.resizable()
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundStyle(.white)
        }
    }
}

struct ProfileImage: View {
    let imageState: PhotosPickerViewModel.ImageState
    
    var body: some View {
        ImportImage(imageState: imageState)
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            .background {
                Circle().fill(
                    LinearGradient(
                        colors: [.yellow, .orange],
                        startPoint: .topLeading,
                        endPoint: .bottom
                    )
                )
            }
    }
}

struct PhotosPickerSampleView: View {
    
    @StateObject var viewModel = PhotosPickerViewModel()
    var body: some View {
        VStack( spacing: 50, content: {
            Spacer().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            ProfileImage(imageState: viewModel.imageState)
                .overlay(alignment: .bottomTrailing, content: {
                    PhotosPicker(selection: $viewModel.imageSelection,
                                 matching: .images,
                                 photoLibrary: .shared()) {
                        Image(systemName: "pencil.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .font(.system(size: 30))
                            .foregroundColor(.accentColor)
                    }
                })
            Button {
                
                viewModel.checkAuthorization()
            } label: {
                Text("Photo Library Permission Check")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(.gray))
            }.buttonStyle(.plain)
            
            PhotosPicker(selection: $viewModel.imageSelections) {
                Text("PhotosPicker - MultiSelect")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(.gray))
            }.buttonStyle(.plain)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10, content: {
                    ForEach(Array(viewModel.selctedImages.enumerated()), id:\.offset) { values in
                        values.element
                            .resizable()
                            .frame(width: 100,height: 100)
                    }
                })
            }
            Spacer()
        })
    }
}

#Preview {
    PhotosPickerSampleView()
}
