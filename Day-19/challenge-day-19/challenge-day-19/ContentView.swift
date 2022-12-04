//
//  ContentView.swift
//  challenge-day-19
//
//  Created by Ojas Gupta on 4/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State  var temperature = 0.0
    @State var currentMeasure = "Celsius"
    @State var idealMeasure = "Fahrenheit"
    @FocusState private var temperatureIsFocused: Bool
    
    var convertedTemperature: Double {
        if currentMeasure == "Celsius" && idealMeasure == "Kelvin" {
            return (temperature + 273.15)
        } else if (currentMeasure == "Celsius" && idealMeasure == "Fahrenheit") {
            return (temperature * 1.8) + 32
        } else if (currentMeasure == "Fahrenheit" && idealMeasure == "Celsius") {
            return (temperature - 32) * 0.5556
        } else if (currentMeasure == "Fahrenheit" && idealMeasure == "Kelvin") {
            return ((5/9) * temperature) + 459.67
        } else if (currentMeasure == "Kelvin" && idealMeasure == "Celsius") {
            return (temperature - 273.15)
        } else if (currentMeasure == "Kelvin" && idealMeasure == "Fahrenheit") {
            return (1.8 * (temperature - 273)) + 32
        } else {
            return temperature
        }
    }
    
    let measureList = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(
                        "Enter in the temperature",
                        value: $temperature,
                        format: .number
                    ).keyboardType(.decimalPad).focused($temperatureIsFocused)
                } header: {
                    Text("Enter in the temperature")
                }
                
                
                Section {
                    Picker("Convert from", selection: $currentMeasure) {
                        ForEach(measureList, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Picker ("To", selection: $idealMeasure) {
                        ForEach(measureList, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Text("The temperature is: \(convertedTemperature.formatted())")
                } header: {
                    Text("After conversion")
                }
            }.navigationTitle("Temperature Converter")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            temperatureIsFocused = false
                        }
                    }
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
