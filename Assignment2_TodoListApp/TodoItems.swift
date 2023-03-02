//
//  TodoItems.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation

class TodoItems: ObservableObject, Identifiable{
    
    @Published var ToDoList: [TodoItem]
    @Published var size: Int
    
    /*
     TODO (variables [min. 1] + initializer)
     Hint: The purpose of this class is to store a collection of TodoItem objects representing the added items. Do you know why? (has to do with each todo item's state)
     */
    
    init() {
        self.ToDoList = [TodoItem(text: "Edit Me")]
        self.size = 1
    }
    
    func addToDoItem(toDo: TodoItem) {
        self.ToDoList.append(toDo)
        self.size += 1
    }
    
    func deleteItem(toDelete: TodoItem) {
        for i in 0...(size - 1) {
            if (self.ToDoList[i] === toDelete) {
                self.ToDoList.remove(at: i)
                self.size -= 1
                return
            }
            
        }
    }
    
    func clearList() {
        self.ToDoList = [TodoItem(text: "Edit Me")]
    }
    
}
