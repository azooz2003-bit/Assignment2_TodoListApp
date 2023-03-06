//
//  TodoItem.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation


class TodoItem: ObservableObject, Identifiable /*  TODO (protocol) */ {
    
    /*
     TODO (variables [min. of 2] + variable initializer)
     */
    var id: UUID
    var itemName: String
    var workDone: Bool
    
    init(itemName: String) {
        self.itemName = itemName
        self.id = UUID()
        self.workDone = false
    }
    
    /*
     TODO (functions [min. of 1])
     */
    
    func iTemComplete() {
        workDone = true
    }
    
    
}
