//
//  TodoItems.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation

class TodoItems: ObservableObject {
    
    @Published var items: [TodoItem] = []
    
    func appendItem(item: TodoItem) {
        self.items.append(item)
    }
    
}
