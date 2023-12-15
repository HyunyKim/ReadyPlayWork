//
//  PhotosPickerViewModel.swift
//  ReadyPlayWork
//
//  Created by Hyuny on 12/7/23.
//

import SwiftUI
import CoreTransferable
import PhotosUI
import Photos

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
        
        static var transferRepresentation: some TransferRepresentation {
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
    @Published var imageSelections: [PhotosPickerItem] = [] {
        didSet {
             self.loadImages()
        }
    }
    @Published var selctedImages: [Image] = []
    
    
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
    
    private func loadImages()  {
        imageSelections.forEach { item in
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let imgData):
                    if let data = imgData , let uiImage = UIImage(data: data) {
                        self.selctedImages.append(Image(uiImage: uiImage))
                    }
                case .failure(let error):
                    print("Load Fail",error)
                }
            }
        }
    }
    
    @discardableResult
    public func checkAuthorization() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        
        var str: String = "sdf"
        let test: [String]
        str.components
        let value = str.map({$0 == "a" ? $0.uppercased() : $0.lowercased()}).joined()
        str.hasSuffix(<#T##suffix: String##String#>)
        let subString = str.dropLast()
        str.components(separatedBy: " ")
        str.dropLast()
        switch status {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { newStatus in
                if newStatus == .authorized {
                    print("Access granted")
                } else {
                    print("Access denied")
                }
            }
            return false
        case .restricted, .denied:
            print("Access denied or restricted")
            return false
            
        case .authorized:
            print("Access already granted.")
            return true
        case .limited:
            print("Access limited.")
            return true
            
        @unknown default:
            print("Unknown ahturization status.")
            return false
        }
    }
    
}
