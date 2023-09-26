//
//  TodoItems.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation

class TodoItems {
    var items: [TodoItem]
    var selected: TodoItem?
    
    init() {
        self.items = []
    }
    init(_ items: [TodoItem]) {
        self.items = items
    }
    
    func addItem(item: TodoItem) {
        self.items.append(item)
    }
    func select(item: TodoItem) {
        // if i weren't lazy, assert item is in items
        self.selected = item;
    }
}
