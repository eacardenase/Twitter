//
//  PhotoPicker.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/9/26.
//

import PhotosUI
import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class PhotosCoordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPicker

        init(parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(
            _ picker: PHPickerViewController,
            didFinishPicking results: [PHPickerResult]
        ) {
            let itemProviders = results.map(\.itemProvider)

            for item in itemProviders
            where item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self) { image, error in
                    if let error {
                        print(
                            "Failed to load object of class UIImage with error: \(error.localizedDescription)"
                        )
                    } else {
                        if let image = image as? UIImage {
                            self.parent.image = image
                        }
                    }
                }
            }

            picker.dismiss(animated: true)
        }
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        var config = PHPickerConfiguration()

        config.filter = .images
        config.selectionLimit = 1

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator

        return picker
    }

    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {
        //
    }

    func makeCoordinator() -> PhotosCoordinator {
        PhotosCoordinator(parent: self)
    }
}
