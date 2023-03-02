//
//  ContentView.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoListScreen: View {
    
    @StateObject var ToDoList: TodoItems = TodoItems()
    @State var selection: Int = 0
    @State var clicked: Bool = false
    @State var clickedItem: TodoItem = TodoItem(text: "Empty")
    
    var body: some View {
    
        NavigationStack {
            VStack {
                Text("Todo-list").font(Font.system(
                    size: 30,
                    weight: Font.Weight.bold,
                    design: Font.Design.rounded
                    )
                )
                
                Button(action: {
                    ToDoList.addToDoItem(toDo: TodoItem(text: "Edit Me"))
                        print("added")
                }, label: {
                    Text("New Item")
                    
                }).padding(.top)
                    .buttonStyle(.bordered)
                    .tint(.blue)
               
                ScrollView {
                    ForEach(self.ToDoList.ToDoList) { item in
                        Button(item.text) {
                            clickedItem = item
                            clicked = true
                        }
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.horizontal)
                        .buttonStyle(.bordered)
                        .tint(item.color)
                    }
                }
            }.navigationDestination(isPresented: $clicked, destination: {
                TodoItemScreen(clicked: $clicked, newName: "jhi", todoitem: $clickedItem ).environmentObject(ToDoList)
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListScreen()
    }
}
