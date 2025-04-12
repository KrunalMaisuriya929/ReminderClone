//
//  String+Extension.swift
//  ReminderClone
//
//  Created by Krunal on 12/04/25.
//

import Foundation

extension String {
     
    var isEmptyPrWhitespace : Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
