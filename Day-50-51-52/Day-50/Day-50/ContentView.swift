//
//  ContentView.swift
//  Day-50
//
//  Created by Ojas Gupta on 7/1/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var orderStore = OrderStore(order: Order())
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $orderStore.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(orderStore.order.quantity)", value: $orderStore.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests", isOn: $orderStore.order.specialRequestEnabled.animation())
                    
                    if orderStore.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $orderStore.order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $orderStore.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: orderStore)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Content")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
