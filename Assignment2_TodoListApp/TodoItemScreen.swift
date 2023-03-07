//
//  TodoItemScreen.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoItemScreen: View {
    @Environment(\.dismiss) private var dismiss

    @EnvironmentObject var todo: TodoItem
        
    var body: some View {
        
        VStack {
            
            TextField("Edit  me", text: $todo.text).frame(width: 100).multilineTextAlignment(.center)
            
            Button("Return by clicking me.", action: {
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
