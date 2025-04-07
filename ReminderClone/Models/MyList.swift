//
//  MyList.swift
//  ReminderClone
//
//  Created by Krunal on 07/04/25.
//

import Foundation
import SwiftData

@Model
class MyList {
    
    var name: String
    var colorCode: String
    
    init(name: String, colorCode: String) {
        self.name = name
        self.colorCode = colorCode
    }
}
