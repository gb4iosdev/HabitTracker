//
//  Activity.swift
//  HabitTracker
//
//  Created by Gavin Butler on 02-08-2020.
//  Copyright © 2020 Gavin Butler. All rights reserved.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    var completedCount: Int = 0
}
