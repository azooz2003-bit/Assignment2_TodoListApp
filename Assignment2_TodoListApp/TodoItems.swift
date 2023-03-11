//
//  TodoItems.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation
import SwiftUI
import Combine


class TodoItems: ObservableObject {
    
    var items: [TodoItem] = [] {
        didSet {
            updateTextSubscriptions()
        }
    }

    var bag = [AnyCancellable?]()
    
    init() {
        updateTextSubscriptions()
    }
    
    func updateTextSubscriptions() {
        bag = items.map({ item in
            item.objectWillChange.sink(receiveValue: {
                self.objectWillChange.send()
            })
            
        })
    }
    
    func appendItem(item: TodoItem) {
        self.items.append(item)
    }
    
}

extension TodoItems {
    
    func deleteLastItem() {
        self.items.removeLast()
    }
}




