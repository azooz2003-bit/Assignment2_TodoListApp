//
//  TodoItems.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation
import SwiftUI
import Combine


class TodoItemsViewModel: ObservableObject { // The TodoItems class we previously implemented was used as a ViewModel.
    
    var multipeer: MultipeerManager
        
    var items: [TodoItem] = [] {
        didSet { // didSet is a function that is always called after data is stored.
            updateTextSubscriptions() // Here we want it to perform this method.
        }
    }

    var todosBag = [AnyCancellable?]() // Simply an array of all the items we want to give State.
    
    init(multipeer: MultipeerManager) {
        self.multipeer = multipeer
        self.multipeer.delegate = self
        updateTextSubscriptions()
    }
    
    func updateTextSubscriptions() {
        // This function will throw in each Todo item, however it will also be given a listener that can inform our views whenever a change occurs. Don't worry about understanding each piece of code.
        todosBag = items.map({ item in
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
