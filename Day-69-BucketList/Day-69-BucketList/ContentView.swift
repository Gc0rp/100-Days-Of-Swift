//
//  ContentView.swift
//  Day-69-BucketList
//
//  Created by Ojas Gupta on 4/2/2023.
//

import MapKit
import SwiftUI
import LocalAuthentication

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
}

struct ContentView: View {
    @State private var isUnlocked = false
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        VStack {
            NavigationView {
                Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                    
        //            MapMarker(coordinate: location.coordinate)
                    MapAnnotation(coordinate: location.coordinate) {
                        
                        NavigationLink {
                            Text(location.name)
                        } label : {
                            Circle()
                                .stroke(.red, lineWidth: 3)
                                .frame(width: 44, height: 44)
    //                            .onTapGesture {
    //                                print("Tapped on \(location.name)")
    //                            }
                            
    //                        Text(location.name)
                        }
                    }
                }
            }
            
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }.onAppear(perform: authenticate)

        
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            
            let reason = "We need to unlock your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                if success {
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    // there was a problem
                }
                
            }
        }  else {
            // no biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
