//
//  Habit.swift
//  Day-47
//
//  Created by Ojas Gupta on 2/1/2023.
//

import Foundation


class Habits: ObservableObject {
    @Published var habitList = [HabitItem]()
}
