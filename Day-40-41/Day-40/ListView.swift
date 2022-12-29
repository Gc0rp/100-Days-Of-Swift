//
//  ListView.swift
//  Day-40
//
//  Created by Ojas Gupta on 28/12/2022.
//

import SwiftUI

struct ListView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack{
                        List(missions) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                HStack {
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
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        } .navigationTitle("Moonshot").padding(.vertical)
                }
                .background(.darkBackground)
                .preferredColorScheme(.dark)
            }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
