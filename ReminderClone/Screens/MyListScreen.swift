//
//  MyListScreen.swift
//  ReminderClone
//
//  Created by Krunal on 07/04/25.
//

import SwiftUI
import SwiftData

struct MyListScreen: View {
    
    @Query private var myLists: [MyList]
    
    let myList = ["Reminders", "Groceries", "Entertainment"]
    @State private var isPresented: Bool = false
    
    var body: some View {

        List{
            Text("My List")
                .font(.largeTitle)
                .bold()
            
            ForEach(myLists) { myList in
                NavigationLink(destination: MyListDetailScreen(myList: myList), label: {
                    HStack{
                        Image(systemName: "line.3.horizontal.circle.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(Color(hex: myList.colorCode))
                        
                        Text(myList.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }

                })
            }
            
            Button(action: {
                isPresented = true
            }, label: {
                Text("Add List")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }).listRowSeparator(.hidden)
            
        }.listStyle(.plain)
            .sheet(isPresented: $isPresented, content: {
                NavigationStack{
                    AddMyListScreen()
                }
            })
        
    }
}

#Preview {
    NavigationStack{
        MyListScreen()
    }.modelContainer(previewContainer)
}
