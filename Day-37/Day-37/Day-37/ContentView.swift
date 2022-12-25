//
//  ContentView.swift
//  Day-37
//
//  Created by Ojas Gupta on 23/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expense()
    @State private var showingAddExpense = false
    
    @State private var circleCategory:Color = .green
    
    var currencySelected = ""
    // green = low cost, yellow = medium cost & red = high cost. All compared in AUD from different currencies.

    
    var body: some View {
        NavigationView {
            Section {
                List {
                    ForEach(expenses.items) {item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            HStack {
                                
                                switch (convertCurrency((item.currency.components(separatedBy: " ")[0]), item.amount)) {
                                case 0...10:
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.green)
                                case 10...100:
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.yellow)
                                default:
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.red)
                                }
                                
                                
                                Text(item.amount, format: .currency(code: item.currency.components(separatedBy: " ")[0]))
                            }
                            
                            
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                
                List {
                    ForEach(expenses.items) {item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            HStack {
                                
                                switch (convertCurrency((item.currency.components(separatedBy: " ")[0]), item.amount)) {
                                case 0...10:
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.green)
                                case 10...100:
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.yellow)
                                default:
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.red)
                                }
                                
                                
                                Text(item.amount, format: .currency(code: item.currency.components(separatedBy: " ")[0]))
                            }
                            
                            
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5, currency: "AUD")
                    
//                    expenses.items.append(expense)
                    
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }

    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
                               
    func convertCurrency(_ selectedCurrency: String, _ amount: Double) -> Double {
        if (selectedCurrency == "USD") {
            return (amount * 1.49)
        } else if (selectedCurrency == "EUR") {
            return (amount * 1.59)
        } else if (selectedCurrency == "GBP") {
            return (amount * 1.79)
        } else if (selectedCurrency == "INR") {
            return (amount * 0.018)
        } else {
            return amount
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
