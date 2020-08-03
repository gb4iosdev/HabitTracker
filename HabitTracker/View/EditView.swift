//
//  EditView.swift
//  HabitTracker
//
//  Created by Gavin Butler on 03-08-2020.
//  Copyright © 2020 Gavin Butler. All rights reserved.
//

import SwiftUI

struct EditView: View {
    
    @ObservedObject var habits: Habits
    
    var activity: Activity
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title:")
                .font(.headline)) {
                    Text("\(activity.title)")
                }
                Section(header: Text("Description:")
                .font(.headline)) {
                    Text("\(activity.description)")
                }
                Section(header: Text("Completions:")
                .font(.headline)) {
                    Text("\(activity.completedCount)")
                    Stepper(
                        onIncrement: { self.updateActivity(by: 1) },
                        onDecrement: { self.updateActivity(by: -1) },
                        label: { Text("Completed \(activity.completedCount) times") }
                    )
                    .labelsHidden()
                    
                }
            }
            .navigationBarTitle("Edit Activity Count")
        }
    }
    
    func updateActivity(by amount: Int) {
        if let activityIndex = habits.activities.firstIndex(where: { $0.id == self.activity.id } ) {
            let newAmount = habits.activities[activityIndex].completedCount + amount
            habits.activities[activityIndex].completedCount = newAmount >= 0 ? newAmount : 0
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(habits: Habits(), activity: Activity(title: "Test", description: "Testing only"))
    }
}
