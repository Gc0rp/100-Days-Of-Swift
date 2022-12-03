//
//  ContentView.swift
//  wesplit
//
//  Created by Ojas Gupta on 2/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    var totalBill: Double {
        return checkAmount + (checkAmount * (Double(tipPercentage) / 100))
    }
    
    let currentCurrency = FloatingPointFormatStyle<Double>.Currency(code: Locale.current.currencyCode ?? "USD")
    
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // Calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount",
                              value: $checkAmount,
                              format: currentCurrency)
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(1..<102) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("\(String(tipPercentage))%")
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: (currentCurrency))
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(totalBill, format: currentCurrency)
                } header : {
                    Text("Total amount (inc. tip)")
                }
            }
          .navigationTitle("WeSplit")
          .toolbar {
              ToolbarItemGroup(placement: .keyboard) {
                  
                  Spacer()
                  
                  Button("Done") {
                      amountIsFocused = false
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
