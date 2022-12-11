//
//  ContentView.swift
//  BetterRest
//
//  Created by Ojas Gupta on 11/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            
            
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...).labelsHidden()
            
            Text(Date.now.formatted(date: .long, time: .omitted))
            
            
            
        }
    }
    
    func trivialExample() {
        var components = DateComponents()
        components.hour = components.hour ?? 0
        components.minute = components.minute ?? 0
        
        let date = Calendar.current.date(from: components) ?? Date.now
    }
    
    func exampleDate() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
