//
//  ReminderCloneApp.swift
//  ReminderClone
//
//  Created by Krunal on 07/04/25.
//

import SwiftUI

@main
struct ReminderCloneApp: App {
    var body: some Scene {
        WindowGroup {
            MyListScreen()
        }.modelContainer(for: MyList.self)
    }
}
