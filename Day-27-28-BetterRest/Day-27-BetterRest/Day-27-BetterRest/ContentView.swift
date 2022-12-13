//
//  ContentView.swift
//  Day-27-BetterRest
//
//  Created by Ojas Gupta on 12/12/2022.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var selectedCupIntake  = 0
    @State private var sleepTime = 0
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("When do you want to wake up").font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute).labelsHidden()
                }
                
                Section {
                    Text("Desired amount of sleep").font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section {
//                    Text("Daily coffee intake").font(.headline)
                    
                    Picker("Coffee Cup Intake", selection: $selectedCupIntake) {
                        
                        ForEach(1..<21) {
                            Text("\($0) cup(s)")
                        }
                        
                    }
                    
//                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                    }
                
                
                Section {
                    
                        Text("\(calculateBedtime)")
                    
                    
                    }
                }
   
                .navigationTitle("BetterRest")
//                .toolbar {
//                    Button("Calculate", action: calculateBedtime)
//                }
                .alert(alertTitle, isPresented: $showingAlert) {
                    Button("OK") { }
                } message: {
                    Text(alertMessage)
                }
            }
    }
    
    var calculateBedtime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            // More code to come here
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
    
            
            return formatter.string(from: (wakeUp - prediction.actualSleep))
//            alertTitle = "Your ideal bedtime is..."
//            alertMessage = sleepTime.formatted(date: .omitted, time:.shortened)
            
            
        } catch {
            // Something went wrong!
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
//        showingAlert = true
        return formatter.string(from: (Date.now))
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
