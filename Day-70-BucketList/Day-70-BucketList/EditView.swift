//
//  EditView.swift
//  Day-70-BucketList
//
//  Created by Ojas Gupta on 5/2/2023.
//

import SwiftUI

struct EditView: View {
    
//    @StateObject public var location: Location
    @Environment(\.dismiss) var dismiss
    public var onSave: (Location) -> Void = {_ in}
    @StateObject private var viewModel: EditViewModel
    
    init(_ location: Location, saveFunction: @escaping (Location) -> Void) {
        _viewModel = StateObject(wrappedValue: EditViewModel(location: location))
        self.onSave = saveFunction
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading...")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = viewModel.location
                    newLocation.id = UUID()
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(Location.example) { newLocation in
            
        }
    }
}
