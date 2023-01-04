//
//  ContentView.swift
//  Day-47
//
//  Created by Ojas Gupta on 2/1/2023.
//

import SwiftUI

struct ContentView: View {
        
    @StateObject var habits = Habits()
    
    @State var showingAddHabit = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(habits.habitList) { habit in
                        NavigationLink {
                            DisplayHabitView(habit: habit, habits: habits)
                        } label : {
                            Text(habit.name)
                        }
                    }
                }
            }.navigationTitle("Habits")
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Add a new habit") {
                    showingAddHabit = true
                }
            }
        }
        .sheet(isPresented: $showingAddHabit) {
            AddHabitView(habits: habits)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
