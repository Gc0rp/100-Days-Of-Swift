//
//  AddView.swift
//  Day-37
//
//  Created by Ojas Gupta on 23/12/2022.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expense
    
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @State private var listOfCurrencies = ["AUD 🇦🇺", "EUR 🇪🇺", "USD 🇺🇸", "GBP 🇬🇧", "INR 🇮🇳"]
    
    @State private var currency = "AUD 🇦🇺"
    
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                HStack {
                    TextField("Amount", value: $amount, format: .currency(code: currency.components(separatedBy: " ")[0]))
                    
                    Picker("", selection: $currency) {
                        ForEach(listOfCurrencies, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Text("Current format: \(currency)")
                Text("Updated format: \(currency.components(separatedBy: " ")[0])")

            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, currency: currency)
                    
                    expenses.items.append(item)
                    
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expense())
    }
}
