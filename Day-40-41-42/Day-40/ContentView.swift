//
//  ContentView.swift
//  Day-40
//
//  Created by Ojas Gupta on 26/12/2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var showGrid: Bool = true
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack{
            if(showGrid) {
                GridView()
            } else {
                ListView()
            }
        }.navigationTitle("Moonshot").toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Button("Grid") {
                        changeView(option: "Grid")
                    }
                    
                    Button("List") {
                        changeView(option: "List")
                    }
                }
            }
        }
    }
    
    func changeView(option: String) {
        if(option == "Grid") {
            showGrid = true
        } else {
            showGrid = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
