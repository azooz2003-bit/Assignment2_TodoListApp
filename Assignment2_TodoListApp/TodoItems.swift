//
//  TodoItems.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation

class TodoItems: ObservableObject, Identifiable /*  TODO (protocol) */ {
    
    /*
     TODO (variables [min. 1] + initializer)
     Hint: The purpose of this class is to store a collection of TodoItem objects representing the added items. Do you know why? (has to do with each todo item's state)
     */
    @Published var todoList: [TodoItem]
    
    init() {
        self.todoList = [TodoItem(itemName: "Add your work")]
    }
    
    /*
     TODO (functions [min. 1])
     */
    
    func addItem(item: TodoItem) {
        self.todoList.append(item)
    }
    
}
