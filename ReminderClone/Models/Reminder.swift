//
//  Reminder.swift
//  ReminderClone
//
//  Created by Krunal on 08/04/25.
//

import Foundation
import SwiftData

@Model
class Reminder {
    
    var title: String
    var notes: String?
    var isCompleted: Bool
    var reminderDate: Date?
    var reminderTime: Data?
    
    var list: MyList?
    
    init(title: String, notes: String? = nil, isCompleted: Bool, reminderDate: Date? = nil, reminderTime: Data? = nil, list: MyList? = nil) {
        self.title = title
        self.notes = notes
        self.isCompleted = isCompleted
        self.reminderDate = reminderDate
        self.reminderTime = reminderTime
        self.list = list
    }
    
}
