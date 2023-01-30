//
//  ContentView.swift
//  Day-63-Instafilter
//
//  Created by Ojas Gupta on 29/1/2023.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            
            Button("Select Image") {
                showingImagePicker = true
            }
            
            Button("Save Image") {
                guard let inputImage = inputImage else {return}
                
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage()
            
        }
//        .onAppear(perform: loadImage)
        
    }
    
    func loadImage() {
//        guard let inputImage = UIImage(named: "Example") else { return }
//
//        let beginImage = CIImage(image: inputImage) // Conversion to CIImage allows it be to manipulated easily
//
//        let context = CIContext()
//        let currentFilter = CIFilter.crystallize()
//        currentFilter.inputImage = beginImage
//
//        let amount = 1.0
//        let inputKeys = currentFilter.inputKeys
//
//        if inputKeys.contains(kCIInputIntensityKey) {
//            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
//        }
//
//        if inputKeys.contains(kCIInputRadiusKey) {
//            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
//        }
//
//        if inputKeys.contains(kCIInputScaleKey) {
//            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
//        }
//
//
//        currentFilter.radius = 1000
//        currentFilter.center = CGPoint(x:inputImage.size.width / 2, y: inputImage.size.height / 2)
//
//        guard let outputImage = currentFilter.outputImage else { return }
//
//        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
//            let uiImage = UIImage(cgImage: cgimg)
//            image = Image(uiImage: uiImage)
//        }
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        
//        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
