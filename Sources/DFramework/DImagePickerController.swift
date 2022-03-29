//
//  DImagePickerController.swift
//  
//
//  Created by Yusuf Demirci on 3.03.2022.
//

import UniformTypeIdentifiers
import CoreServices
import UIKit

public class DImagePickerController: UIImagePickerController {

    // MARK: Properties

    public var imageDidSelect: ((UIImage) -> Void)?
    public var pickerDidCancel: (() -> Void)?

    // Call in main thread
    public func setupForCamera() {
        commonSetup()
        self.sourceType = .camera
        self.mediaTypes = [kUTTypeImage as String]
    }

    // Call in main thread
    public func setupForPhotoLibrary() {
        commonSetup()
        self.sourceType = .photoLibrary
        self.mediaTypes = [kUTTypeImage as String]
    }
}

// MARK: - UINavigationControllerDelegate, UIImagePickerControllerDelegate

extension DImagePickerController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var image: UIImage?

        if let originalImage = info[.originalImage] as? UIImage {
            image = originalImage
        }

        if let editedImage = info[.editedImage] as? UIImage {
            image = editedImage
        }

        if let image = image {
            imageDidSelect?(image)
        }

        dismiss(animated: true)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
        pickerDidCancel?()
    }
}

// MARK: - Privates

private extension DImagePickerController {

    func commonSetup() {
        self.delegate = self
        self.allowsEditing = true
    }
}
