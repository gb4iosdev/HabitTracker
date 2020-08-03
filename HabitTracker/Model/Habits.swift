//
//  Activities.swift
//  HabitTracker
//
//  Created by Gavin Butler on 02-08-2020.
//  Copyright © 2020 Gavin Butler. All rights reserved.
//

import Foundation

class Habits: ObservableObject {
    @Published var activities: [Activity] = [] {
        didSet {
            let encoder = JSONEncoder()
            
            if let encodedHabits = try? encoder.encode(self.activities) {
                UserDefaults.standard.set(encodedHabits, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let habitsData = UserDefaults.standard.data(forKey: "Habits") {
            let decoder = JSONDecoder()
            
            if let decodedHabits = try? decoder.decode([Activity].self, from: habitsData) {
                self.activities = decodedHabits
                return
            }
        }
        
        self.activities = []
    }
}
