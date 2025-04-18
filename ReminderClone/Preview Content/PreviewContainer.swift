//
//  PreviewContainer.swift
//  ReminderClone
//
//  Created by Krunal on 07/04/25.
//

import Foundation
import SwiftData

@MainActor
var previewContainer: ModelContainer = {

    let container = try! ModelContainer(for: MyList.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for myList in SampleData.myLists {
        container.mainContext.insert(myList)
        myList.reminders = SampleData.reminder
    }
    
    return container
    
}()

struct SampleData {
    
    static var myLists: [MyList] {
        return [MyList(name: "Groceries", colorCode: "#2ec71"), MyList(name: "Backlog", colorCode: "#965966")]
    }

    static var reminder: [Reminder] {
        return [Reminder(title: "Reminder 1", notes: "This is reminder 1 notes!", reminderDate: Date(), reminderTime: Date()), Reminder(title: "Reminder 2", notes: "This is a reminder 2 notes")]
    }
}
