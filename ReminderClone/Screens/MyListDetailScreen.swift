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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
