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
    
    var multipeer: MultipeerManager
    
    var items: [TodoItem] = [] {
        didSet {
            updateTextSubscriptions()
        }
    }

    var bag = [AnyCancellable?]()
    
    init(multipeer: MultipeerManager) {
        self.multipeer = multipeer
        self.multipeer.delegate = self
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
        DispatchQueue.main.async { // DW about this, ensures we're updating the views from the main thread (SwiftUI must be rendered on the main).
            self.objectWillChange.send() // To signal a change in the array to our view.
        }
    }
    
}

extension TodoItems {
    
    func deleteLastItem() {
        self.items.removeLast()
    }
}




