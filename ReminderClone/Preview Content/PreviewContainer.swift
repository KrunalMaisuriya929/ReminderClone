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
    }
    
    return container
    
}()

struct SampleData {
    
    static var myLists: [MyList] {
        return [MyList(name: "Reminder", colorCode: "#2ec71"), MyList(name: "Backlog", colorCode: "#965966")]
    }
}
