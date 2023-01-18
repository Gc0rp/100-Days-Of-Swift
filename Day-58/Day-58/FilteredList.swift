//
//  FilteredList.swift
//  Day-58
//
//  Created by Ojas Gupta on 18/1/2023.
//

import SwiftUI

struct FilteredList: View {
    @State private var score = 0
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}
