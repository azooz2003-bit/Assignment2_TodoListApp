//
//  TodoItemScreen.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoItemScreen: View {
    
    @EnvironmentObject var ToDoList: TodoItems
    @Binding var clicked: Bool
    @Binding var todoitem: TodoItem
    
//    @Binding var index: Int
    
    var body: some View {
                
        VStack {
//            Button(action: {
//                ToDoList.addToDoItem(toDo: TodoItem(text: "Edit Me"))
//                print("added")
//            }, label: {
//                Text("Edit Name")
//
//            }).padding(.top)
//                .buttonStyle(.bordered)
//                .tint(.blue)
            
            TextEditor(text: $todoitem.text)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                            .navigationTitle("To-Do Item")
                            
                
                
            
            HStack {
                
                
                Button(action: {
                    clicked = false
                    let temp = TodoItem(text: "Dont care")
                    ToDoList.addToDoItem(toDo: temp)
                    ToDoList.deleteItem(toDelete: temp)
                }, label: {
                    Text("Return")
                    
                }).padding(.top)
                    .buttonStyle(.bordered)
                    .tint(.yellow)
                
                
                Button(action: {
                    clicked = false
                    ToDoList.deleteItem(toDelete: todoitem)
                }, label: {
                    Text("Delete")
                    
                }).padding(.top)
                    .buttonStyle(.bordered)
                    .tint(.blue)
            }
        }
    }
}

//struct TodoItemScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoItemScreen(clicked: bindin, ToDoItem: TodoItem(text: "Hello"))
//    }
//}
