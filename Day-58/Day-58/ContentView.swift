//
//  ContentView.swift
//  Day-58
//
//  Created by Ojas Gupta on 18/1/2023.
//


import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH %@", "E")) var ships: FetchedResults<Ship>
    // %@ is a filler for 'Star Wars'
    
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>

    @State private var lastNameFilter = "A"
    var body: some View {
        VStack {
//            List(ships, id: \.self) { ship in
//                Text(ship.name ?? "Unknown name")
//            }
//
//            Button("Add Examples") {
//                let ship1 = Ship(context: moc)
//                ship1.name = "Enterprise"
//                ship1.universe = "Star Trek"
//
//
//                let ship2 = Ship(context: moc)
//                ship2.name = "Defiant"
//                ship2.universe = "Star Trek"
//
//
//                let ship3 = Ship(context: moc)
//                ship3.name = "Millenium Falcon"
//                ship3.universe = "Star Wars"
//
//
//                let ship4 = Ship(context: moc)
//                ship4.name = "Executor"
//                ship4.universe = "Star Wars"
//
//                try? moc.save()
//            }
            
            FilteredList(sortDescriptorList: [
                NSSortDescriptor(key: "lastName", ascending: true)
            ], filterKey: "lastName", filterValue: lastNameFilter, predicateValue: .BEGINSWITH) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? self.moc.save()
            }

            Button("Show A") {
                self.lastNameFilter = "A"
            }

            Button("Show S") {
                self.lastNameFilter = "S"
            }
            
//            List {
//                ForEach(countries, id: \.self) { country in
//                    Section(country.wrappedFullName) {
//                        ForEach(country.candyArray, id: \.self) { candy in
//
//                            Text(candy.wrappedName)
//
//                        }
//                    }
//                }
//            }
//
//            Button("Add Examples") {
//                let candy1 = Candy(context: moc)
//                candy1.name = "Mars"
//                candy1.origin = Country(context: moc)
//                candy1.origin?.shortName = "UK"
//                candy1.origin?.fullName = "United Kingdom"
//
//
//                let candy2 = Candy(context: moc)
//                candy2.name = "KitKat"
//                candy2.origin = Country(context: moc)
//                candy2.origin?.shortName = "UK"
//                candy2.origin?.fullName = "United Kingdom"
//
//
//
//                let candy3 = Candy(context: moc)
//                candy3.name = "Twix"
//                candy3.origin = Country(context: moc)
//                candy3.origin?.shortName = "UK"
//                candy3.origin?.fullName = "United Kingdom"
//
//
//                let candy4 = Candy(context: moc)
//                candy4.name = "Toblerone"
//                candy4.origin = Country(context: moc)
//                candy4.origin?.shortName = "CH"
//                candy4.origin?.fullName = "Switzerland"
//
//
//                try? moc.save()
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
