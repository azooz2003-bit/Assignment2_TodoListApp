//
//  TodoItem.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation
import SwiftUI


class TodoItem: ObservableObject, Identifiable, Equatable {
    
    static func == (lhs: TodoItem, rhs: TodoItem) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    
    @Published var text: String
    @Published var color: Color
    @Published var uuid: UUID
    @Published var date: Date
    
    /*
     TODO (variables [min. of 2] + variable initializer)
     */
    init(text: String) {
        self.text = text
        self.color = Color(red: .random(in: 0...1),
                           green: .random(in: 0...1),
                           blue: .random(in: 0...1))
        self.uuid = UUID()
        self.date = Date()
    }
    
    
    func switchColor() {
        self.color = Color(red: .random(in: 0...1),
                          green: .random(in: 0...1),
                          blue: .random(in: 0...1))
    }
    
    func ToDoLater() {
        self.text = "SKIP FOR NOW: " + self.text
    }
    
    func changeText(newText: String) {
        self.text = newText
    }
    
}
