//
//  ImagePicker.swift
//  Day-63-Instafilter
//
//  Created by Ojas Gupta on 29/1/2023.
//

import PhotosUI
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = PHPickerViewController
}
