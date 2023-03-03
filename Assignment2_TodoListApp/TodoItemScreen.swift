//
//  TodoItemScreen.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoItemScreen: View {
    @Environment(\.dismiss) private var dismiss

    @ObservedObject var todo: TodoItem
        
    var body: some View {
        
        VStack {
            
            TextField("Edit  me", text: $todo.text)
            Button("Return by clicking me.", action: {
                todo.objectWillChange.send()
                dismiss()
            })
        }
    }
}

struct TodoItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
