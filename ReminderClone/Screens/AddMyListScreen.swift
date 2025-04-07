//
//  AddMyListScreen.swift
//  ReminderClone
//
//  Created by Krunal on 07/04/25.
//

import SwiftUI

struct AddMyListScreen: View {
    
    @State private var color : Color = .blue
    @State private var listName: String = ""
    
    var body: some View {
        VStack{
            Image(systemName: "line.3.horizontal.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.blue)
            
            TextField("List Name", text: $listName)
                .textFieldStyle(.roundedBorder)
                .padding([.leading, .trailing], 44)
        
            colorPickerView(selectedColor: $color)
        }
    }
}

#Preview {
    AddMyListScreen()
}
