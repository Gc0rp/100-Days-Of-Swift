//
//  AddHabitView.swift
//  Day-47
//
//  Created by Ojas Gupta on 2/1/2023.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habits: Habits
    @State var habitName = ""
    @State var description = ""
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Habit Name", text: $habitName)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add a new habit")
            .navigationBarItems(leading: Button(action: {
                
                dismiss()
                
            }) {
                Text("Dismiss")
            }, trailing: Button(action: {
                
                let habit = HabitItem(name: habitName, description: description, completionCount: 0)

                do {
                    try AddHabit(habit)
                } catch {
                    print("There is an error: \(error)")
                }

                
            }) {
                Text("Add Habit")
            })
        }
    }
    
    func AddHabit (_ habit: HabitItem) throws -> Void {
        habits.habitList.append(habit)
        
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(habits.habitList) {
            let fileUrl = URL(fileURLWithPath: "file.json")
            try data.write(to: fileUrl, options: .atomic)
        }
        
        dismiss()
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
