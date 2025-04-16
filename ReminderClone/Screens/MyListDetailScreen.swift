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
    @State private var title: String = ""
    @State private var isNewReminderPresented : Bool = false
    
    private var isFormValid : Bool {
        !title.isEmptyPrWhitespace
    }
    
    private func saveReminder() {
        let reminder = Reminder(title: title)
        myList.reminders.append(reminder)
    }
    
    var body: some View {
        VStack{
            List(myList.reminders) { reminder in
                ReminderCellView(reminder: reminder, isSelected: false) { event in
                    switch event {
                    case .onChecked(let reminder, let checked):
                        print("onChecked")
                    case .onSelecte(let reminder):
                        print("OnSelect")
                    case .onInfoSelected(let reminder):
                        print("OnInfoSelected")
                    }
                }
                
            }
            
            Spacer()
            Button(action: {
                isNewReminderPresented = true
            }, label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("New Reminder")
                }
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }.navigationTitle(myList.name)
            .alert("New Reminder", isPresented: $isNewReminderPresented) {
                TextField("", text: $title)
                Button("Cancel", role: .cancel){ }
                Button("Done"){
                    if isFormValid{
                        saveReminder()
                    }
                }//.disabled(!isFormValid)
            }
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
