//
//  PhotosPickerViewModel.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 12/7/23.
//

import SwiftUI
import CoreTransferable
import PhotosUI

@MainActor
final class PhotosPickerViewModel: ObservableObject {
    enum ImageState {
        case empty
        case loading(Progress)
        case success(Image)
        case failure(Error)
    }
    
    enum TransferError: Error {
        case importFiled
    }
    
    struct LoadedImage: Transferable {
        let image: Image
        
        static
        var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
                guard let uiImage = UIImage(data: data) else {
                    throw TransferError.importFiled
                }
                let image = Image(uiImage: uiImage)
                return LoadedImage(image: image)
            }
        }
    }
    
    @Published private(set) var imageState: ImageState = .empty
    
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            if let imageSelection {
                let progress = loadTransferable(from: imageSelection)
                imageState = .loading(progress)
            } else {
                imageState = .empty
            }
        }
    }
    
    
    private func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
        return imageSelection.loadTransferable(type: LoadedImage.self) { result in
            DispatchQueue.main.async {
                guard imageSelection == self.imageSelection else {
                    print("Failed to get the selected Item")
                    return
                }
                switch result {
                case .success(let loadImage?):
                    self.imageState = .success(loadImage.image)
                case .success(nil):
                    self.imageState = .empty
                case .failure(let error):
                    self.imageState = .failure(error)
                }
            }
        }
    }
    
}
