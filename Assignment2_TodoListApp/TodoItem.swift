//
//  TodoItem.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation


class TodoItem: ObservableObject, Identifiable  {
    
    var text: String
    var id: String = UUID().uuidString
    
    init(text: String) {
        self.text = text
    }
    
    func changeTextTo(text: String) {
        self.text = text
    }
    
}
