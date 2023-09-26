//
//  TodoItemScreen.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoItemScreen: View {
    var item: TodoItem
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle(item.title)
        }
    }
}

struct TodoItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemScreen(
            item: TodoItem(
                title: "item",
                desc: "this does things",
                deadline: "09/26/2023"
            )
        )
    }
}
