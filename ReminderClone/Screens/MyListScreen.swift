//
//  MyListScreen.swift
//  ReminderClone
//
//  Created by Krunal on 07/04/25.
//

import SwiftUI

struct MyListScreen: View {
    
    let myList = ["Reminders", "Groceries", "Entertainment"]
    
    var body: some View {

        List{
            
            Text("My List")
                .font(.largeTitle)
                .bold()
            
            ForEach(myList, id: \.self) { myList in
                HStack{
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .font(.system(size: 32))
                    
                    Text(myList)
                    
                }
            }
            
            Button(action: {
                
            }, label: {
                Text("Add List")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }).listRowSeparator(.hidden)
            
        }.listStyle(.plain)
        
    }
}

#Preview {
    NavigationStack{
        MyListScreen()
    }
}
