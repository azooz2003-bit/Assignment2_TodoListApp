//
//  TodoItem.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation


class TodoItem: Identifiable {
    let id: String
    var title: String
    var desc: String
    var deadline: String // i am too lazy to make this a date but it's a date string trust
    
    init(title: String, desc: String, deadline: String) {
        self.id = UUID().uuidString
        self.title = title
        self.desc = desc
        self.deadline = deadline
    }
    
    func changeDescription(desc: String) {
        self.desc = desc
    }
}
