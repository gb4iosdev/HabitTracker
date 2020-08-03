//
//  ContentView.swift
//  HabitTracker
//
//  Created by Gavin Butler on 02-08-2020.
//  Copyright © 2020 Gavin Butler. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.activities) { activity in
                    NavigationLink(destination: EditView(habits: self.habits, activity: activity)) {
                        HStack {
                            Text("\(activity.title)")
                            Spacer()
                            Text("\(activity.completedCount)")
                        }
                    }
                }
            .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(trailing: Button(action: {
                self.showingAddActivity = true
                }) {
                    Image(systemName: "plus")
                        .font(.headline)
                })
            .sheet(isPresented: $showingAddActivity) {
                AddView(habits: self.habits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
