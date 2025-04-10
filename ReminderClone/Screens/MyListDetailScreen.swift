//
//  MyListDetailScreen.swift
//  ReminderClone
//
//  Created by Krunal on 08/04/25.
//

import SwiftUI
import SwiftData

struct MyListDetailScreen: View {
    
    let myList: MyList
    
    var body: some View {
        VStack{
            List(myList.reminders) { reminder in
                Text(reminder.title)
                
            }
            
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("New Reminder")
                }
            })
            .frame(maxWidth: .infinity, alignment: .leading)
        }
            .navigationTitle(myList.name)
    }
}


struct MyListDetailScreenContainer: View {
    
    @Query private var myLists: [MyList]
    
    var body: some View {
        MyListDetailScreen(myList: myLists[0])
    }
}

#Preview { @MainActor in
    
    NavigationStack{
        MyListDetailScreenContainer()
            .modelContainer(previewContainer)
    }
    
}
