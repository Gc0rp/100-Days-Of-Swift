//
//  DisplayHabitView.swift
//  Day-47
//
//  Created by Ojas Gupta on 2/1/2023.
//

import SwiftUI

struct DisplayHabitView: View {
    @State var habit: HabitItem
    @ObservedObject var habits: Habits
    
    var body: some View {
        NavigationView {
            VStack {
                Text(habit.description)

                HStack {
                    Button(action: {updateCompletionCount(by: "-")}) {
                        Text("-")
                    }
                    
                    Text("Habit completed \(habit.completionCount) time(s)")
                    
                    Button(action: {updateCompletionCount(by: "+")}) {
                        Text("+")
                    }
                }

            }
            .navigationTitle(habit.name)
        }

    }
    
    func updateCompletionCount(by action: String) {
        if(action == "+") {
            if let habitLocation = habits.habitList.firstIndex(of: habit) {
                
                habit.completionCount += 1
                habits.habitList[habitLocation] = habit
                
            }
        } else {
            if(habit.completionCount - 1 >= 0) {
                habit.completionCount -= 1
            }
        }
    }
}

struct DisplayHabitView_Previews: PreviewProvider {
    static var previews: some View {
        var habit = HabitItem(name: "Test Habit", description: "This is a test habit", completionCount: 0)
        
        DisplayHabitView(habit: habit, habits: Habits())
    }
}
