//
//  ContentView.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoListScreen: View {
    
    /*
     TODO (variables [min. 2])
     */
//    @ObservedObject var todoItems = TodoItems()
    @StateObject var itemList: TodoItems = TodoItems()
    @State var newTodo: String = ""
        
        var body: some View {
            VStack {
                Text("Todo-list").font(.title)
                
                List(itemList.todoList) { todo in
                    NavigationLink(
                        destination: TodoItemView(todoItem: todo),
                        label: {
                            Text(todo.itemName)
                        })
                }
                
                HStack {
                    TextField("Add a new todo list", text: $newTodo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        let newTodoItem = TodoItem(itemName: newTodo)
                        itemList.addItem(item: newTodoItem)
                        self.newTodo = ""
                    }, label: {
                        Text("Add")
                    })
                    
                    Button(action: {
                        itemList.todoList.removeAll()
                    }, label: {
                        Text("Clear")
                    }).foregroundColor(.red)

                }.padding()
            }
        }
    }


struct TodoItemView: View {
    let todoItem: TodoItem
    
    var body: some View {
        Text("Todo item: \(todoItem.itemName)")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListScreen()
    }
}

