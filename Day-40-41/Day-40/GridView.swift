//
//  GridView.swift
//  Day-40
//
//  Created by Ojas Gupta on 28/12/2022.
//

import SwiftUI

struct GridView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack{
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    
                                    
                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                        
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
//                                    .background(.lightBackground)
                                }
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(.lightBackground)
//                                )
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
                
                .background(.darkBackground)
                .preferredColorScheme(.dark)
            }
        }.navigationTitle("Moonshot")
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
