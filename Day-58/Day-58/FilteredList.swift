//
//  FilteredList.swift
//  Day-58
//
//  Created by Ojas Gupta on 18/1/2023.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @State private var score = 0
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    //%K BEGINSWITH %@
    
    init(sortDescriptorList: [NSSortDescriptor], filterKey: String, filterValue: String, predicateValue: PredicateParameter, @ViewBuilder content: @escaping (T) -> Content) {
        let pred_value: String = predicateValue.rawValue
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptorList, predicate: NSPredicate(format: pred_value, filterKey, filterValue))
        
        self.content = content
    }
}
