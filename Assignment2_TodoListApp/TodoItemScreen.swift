//
//  TodoItemScreen.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoItemScreen: View {
    
    @EnvironmentObject var todos: TodoItems
    
    var body: some View {
        
        VStack {
            
        }
    }
}

struct TodoItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemScreen().environmentObject(TodoItems())
    }
}
