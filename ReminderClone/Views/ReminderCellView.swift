//
//  ReminderCellView.swift
//  ReminderClone
//
//  Created by Krunal on 14/04/25.
//

import SwiftUI
import SwiftData

struct ReminderCellView: View {
    
    let reminder: Reminder
    
    var body: some View {
        HStack(alignment: .top){
            
            Image(systemName: "circle")
                .font(.title2)
                .padding([.trailing], 5)
                .onTapGesture {
                    
                }
            
            VStack{
                Text(reminder.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                if let notes = reminder.notes{
                    Text(notes)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack{
                    if let reminderDate = reminder.reminderDate{
                        Text(reminderDate.formatted())
                    }
                    
                    if let reminderDate = reminder.reminderTime{
                        Text(reminderDate.formatted())
                    }
                    
                }
                .font(.caption)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct ReminderCellViewContainer: View {
    
    @Query(sort: \Reminder.title) private var reminder: [Reminder]
    
    var body: some View{
        ReminderCellView(reminder: reminder[0])
    }
}

#Preview {
    ReminderCellViewContainer()
        .modelContainer(previewContainer)
}
