//
//  TodoItem.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation
import SwiftUI

class TodoItem: ObservableObject, Identifiable {
    var id: String = UUID().uuidString
    @Published var title: String
    @Published var priority: Priority
    @Published var dateAdded: Date
    
    
    init(title: String, priority: Priority) {
        self.title = title
        self.priority = priority
        self.dateAdded = Date()
    }
    
    // TODO: add functions
    
    enum Priority {
        case low
        case medium
        case high
        
        func color() -> Color {
            switch self {
                case .low: return .gray
                case .medium: return .yellow
                case .high: return .red
            }
        }
    }
}
