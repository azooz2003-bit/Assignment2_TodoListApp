//
//  TodoItem.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation


class TodoItem:Identifiable, Encodable, Decodable/*  TODO (protocol) */ {
    
    /*
     TODO (variables [min. of 2] + variable initializer)
     */
    var id: UUID
    var title: String
    var complete: Bool
    
    init(id: UUID = UUID(), title: String) {
        self.id = id
        self.title = title
        self.complete = false
    }
    
    /*
     TODO (functions [min. of 1])
     */
    func markComplete() {
        complete = true
    }
    
    func editTitle(title: String) {
        self.title = title
    }
}
