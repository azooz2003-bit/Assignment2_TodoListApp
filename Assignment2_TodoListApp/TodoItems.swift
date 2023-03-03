//
//  TodoItems.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation
import SwiftUI

class TodoItems: ObservableObject {
    
    /*
     TODO (variables [min. 1] + initializer)
     Hint: The purpose of this class is to store a collection of TodoItem objects representing the added items. Do you know why? (has to do with each todo item's state)
     */
    @Published var items: [TodoItem]
    
    init(startingItems: [TodoItem]) {
        self.items = startingItems
    }
    
    
    /*
     TODO (functions [min. 1])
     */
    
}
