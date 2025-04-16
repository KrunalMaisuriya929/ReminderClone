//
//  ReminderCellView.swift
//  ReminderClone
//
//  Created by Krunal on 14/04/25.
//

import SwiftUI
import SwiftData

enum ReminderCellEvents {
    case onChecked(Reminder, Bool)
    case onSelecte(Reminder)
    case onInfoSelected(Reminder)
}

struct ReminderCellView: View {
    
    let reminder: Reminder
    let isSelected : Bool
    let onEvent: (ReminderCellEvents) -> Void
    @State private var checked : Bool = false
    
    var body: some View {
        HStack(alignment: .top){
            
            Image(systemName: "circle")
                .font(.title2)
                .padding([.trailing], 5)
                .onTapGesture {
                    checked.toggle()
                    onEvent(.onChecked(reminder, checked))
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
            Spacer()
            Image(systemName: "info.circle.fill")
                .opacity(isSelected ? 1 : 0)
                .onTapGesture {
                    onEvent(.onInfoSelected(reminder))
                }
            
        }.contentShape(Rectangle())
            .onTapGesture {
                onEvent(.onSelecte(reminder))
            }
    }
}

struct ReminderCellViewContainer: View {
    
    @Query(sort: \Reminder.title) private var reminder: [Reminder]
    
    var body: some View{
        ReminderCellView(reminder: reminder[0], isSelected: false) { _ in
            
        }
    }
}

#Preview {
    ReminderCellViewContainer()
        .modelContainer(previewContainer)
}
