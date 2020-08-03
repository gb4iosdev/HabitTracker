//
//  AddView.swift
//  HabitTracker
//
//  Created by Gavin Butler on 02-08-2020.
//  Copyright © 2020 Gavin Butler. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var habits: Habits
    
    @State private var activityTitle: String = ""
    @State private var activityDescription: String = ""
    
    @State private var showAlert = false
    @State private var notPopulated = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity Title", text: $activityTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Activity Description", text: $activityDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .navigationBarTitle("Add New Activity")
            .navigationBarItems(trailing:
                Button("Save") {
                    guard self.activityTitle != "" else {
                        self.notPopulated = "Activity Title"
                        self.showAlert = true
                        return
                    }
                    guard self.activityDescription != "" else {
                        self.notPopulated = "Activity Description"
                        self.showAlert = true
                        return
                    }
                    let activityfromUI = Activity(title: self.activityTitle, description: self.activityDescription)
                    self.habits.activities.append(activityfromUI)
                    self.presentationMode.wrappedValue.dismiss()
                })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("\(notPopulated) is not populated"), message: Text("Please enter text in \(notPopulated)"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
