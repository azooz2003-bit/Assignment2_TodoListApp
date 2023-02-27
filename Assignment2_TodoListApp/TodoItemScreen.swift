//
//  TodoItemScreen.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoItemScreen: View {
    
    @EnvironmentObject var todos: TodoItems = TodoItems()
    
    var body: some View {
        
        
        VStack {
            
            ScrollView {
                let items: [TodoItem] = todos.items

                ForEach(items, id: \.self.id) { item in
                    
                    NavigationLink(item.t, destination: {Todo})
                    
                }
                
            }
        }
        
    }
}

struct TodoItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemScreen()
    }
}
