//
//  AddMyListScreen.swift
//  ReminderClone
//
//  Created by Krunal on 07/04/25.
//

import SwiftUI

struct AddMyListScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var color : Color = .blue
    @State private var listName: String = ""
    
    var body: some View {
        VStack{
            Image(systemName: "line.3.horizontal.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(color)
            
            TextField("List Name", text: $listName)
                .textFieldStyle(.roundedBorder)
                .padding([.leading, .trailing], 44)
        
            colorPickerView(selectedColor: $color)
        }
        .navigationTitle("New List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    guard let hex = color.toHex() else { return }
                    
                    let myList = MyList(name: listName, colorCode: hex)
                    context.insert(myList)
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview { @MainActor in
    NavigationStack{
        AddMyListScreen()
    }.modelContainer(previewContainer)
}
