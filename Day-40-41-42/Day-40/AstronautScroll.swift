//
//  AstronautScroll.swift
//  Day-40
//
//  Created by Ojas Gupta on 28/12/2022.
//

import SwiftUI

struct AstronautScroll: View {
    let crewMember: CrewMember
    
    var body: some View {
            NavigationLink {
                AstronautView(astronaut: crewMember.astronaut)
            } label : {
                HStack {
                    Image(crewMember.astronaut.id)
                        .resizable()
                        .frame(width: 104, height: 72)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .strokeBorder(.white, lineWidth: 1)
                        )
                    
                    VStack(alignment: .leading) {
                        Text(crewMember.astronaut.name)
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        Text(crewMember.role)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)
            }
    }
    
    
    init(crewMember: CrewMember) {
        self.crewMember = crewMember
    }
}

struct AstronautScroll_Previews: PreviewProvider {
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static let crewMember: CrewMember = CrewMember (role: missions[0].crew[0].role, astronaut: astronauts[missions[0].crew[0].name]!)
    
    static var previews: some View {
        AstronautScroll(crewMember: crewMember).preferredColorScheme(.dark)
    }
}
