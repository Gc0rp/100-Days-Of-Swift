//
//  ContentView-ViewModel.swift
//  Day-70-BucketList
//
//  Created by Ojas Gupta on 7/2/2023.
//

import Foundation
import MapKit
import LocalAuthentication

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        
        @Published private(set) var locations: [Location]
        @Published var selectedPlace: Location?
        @Published var isUnlocked = false
        
        @Published var invalidLogin = false
        
        let savePath = FileManager.documentsDirectory.appendingPathExtension("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation() {
            // create a new location
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            
            locations.append(newLocation)
            
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace = selectedPlace else {return}
                    
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                    success, authenticationError in
                    
                    if success {
                        Task { @MainActor in
                                self.isUnlocked = true
                        }
                    } else {
                        // error
                        print(error?.localizedDescription ?? "error")
                    }
                }
            } else {
                // no biometrics
            }
        }
    }
    
    
}
