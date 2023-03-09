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
    
    var items: [TodoItem] = [] {
        didSet { // didSet is a function that is always called after data is stored.
            updateTextSubscriptions() // Here we want it to perform this method.
        }
    }

    var bag = [AnyCancellable?]() // Simply an array of all the items we want to give State.
    
    init() {
        updateTextSubscriptions()
    }
    
    func updateTextSubscriptions() {
        // This function will throw in each Todo item, however it will also be given a listener that can inform our views whenever a change occurs. Don't worry about understanding each piece of code.
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
