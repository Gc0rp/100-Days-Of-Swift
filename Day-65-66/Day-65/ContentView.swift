//
//  ContentView.swift
//  Day-65
//
//  Created by Ojas Gupta on 31/1/2023.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var radiusIntensity = 0.0
    @State private var scaleIntensity = 1.0
    @State private var amountIntensity = 0.0
    @State private var evIntensity = 0.0
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var showingIntensitySlider = false
    @State private var showingRadiusSlider = false
    @State private var showingScaleSlider = false
    @State private var showingAmountSlider = false
    @State private var showingEVSlider = false
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    if(currentFilter == CIFilter.maskToAlpha()) {
                        Rectangle()
                            .fill(.white)
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }

                    
                    Text((image == nil) ? "Tap to select a picture" : "" )
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                
                ControlAmount(showSlider: $showingIntensitySlider, label: "Intensity", filterAmount: $filterIntensity, process: applyProcessing)
                
                ControlAmount(showSlider: $showingRadiusSlider, label: "Radius", filterAmount: $radiusIntensity, process: applyProcessing)
                
                ControlAmount(showSlider: $showingAmountSlider, label: "Amount", filterAmount: $amountIntensity, process: applyProcessing)
                
                ControlAmount(showSlider: $showingEVSlider, label: "Exposure", filterAmount: $evIntensity, process: applyProcessing)
                
                ControlAmount(showSlider: $showingScaleSlider, label: "Scale", filterAmount: $scaleIntensity, process: applyProcessing)
                
                HStack {
                    Button("Change Filter") {
                        showingFilterSheet = true
                    }
                    
                    Spacer()
                    
                    Button("Save", action: save).disabled(image == nil)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                
                VStack {
                    Button("Crystalize") { setFilter(CIFilter.crystallize()) }
                    Button("Edges") { setFilter(CIFilter.edges()) }
                    Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                    Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                    Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                    Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                }
                
                VStack {
                    Button("Vignette") { setFilter(CIFilter.vignette()) }
                    Button("Invert Color") {setFilter(CIFilter.colorInvert())}
                    Button("Vibrance") {setFilter(CIFilter.vibrance())}
                    Button("Mask To Alpha") {setFilter(CIFilter.maskToAlpha())}
                    Button("Exposure") {setFilter(CIFilter.exposureAdjust())}
                }
                
                Button("Cancel", role: .cancel) {}
                
                
//                CIFilter.unsharpMask()
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
        
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            print("Success!")
        }
        
        imageSaver.errorHandler = {
            print("Oops! \($0.localizedDescription)")
        }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        print(inputKeys)
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
            
            showingIntensitySlider = true
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(radiusIntensity * 200, forKey: kCIInputRadiusKey)
            
            showingRadiusSlider = true
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(scaleIntensity * 10, forKey: kCIInputScaleKey)
            
            showingScaleSlider = true
        }
        
        if inputKeys.contains(kCIInputEVKey) {
            currentFilter.setValue(evIntensity * 10, forKey: kCIInputEVKey)
            
            showingEVSlider = true
        }
        
        if inputKeys.contains(kCIInputAmountKey) {
            currentFilter.setValue(amountIntensity * 10, forKey: kCIInputAmountKey)
            
            showingAmountSlider = true
        }
        

        guard let outputImage = currentFilter.outputImage else { return }

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
        
    }
    
    func setFilter(_ filter: CIFilter) {
        showingRadiusSlider = false
        showingIntensitySlider = false
        showingScaleSlider = false
        showingAmountSlider = false
        showingEVSlider = false
        
        currentFilter = filter
        loadImage()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
