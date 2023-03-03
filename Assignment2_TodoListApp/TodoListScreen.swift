//
//  ContentView.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoListScreen: View {
    
    @StateObject var todoList: TodoItems = TodoItems(startingItems: [
        TodoItem(title: "Do laundry", priority: .medium),
        TodoItem(title: "Do homework", priority: .high),
        TodoItem(title: "Water plants", priority: .medium),
        TodoItem(title: "Call mom", priority: .low)
    ])
    
    @State var didSelect: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                ForEach(todoList.items) { item in
                    Button(action: {
                        didSelect = true
                    }, label: {
                        HStack(alignment: .center) {
                            Text(item.title)
                        }
                    }).padding(10)
                        .navigationDestination(isPresented: $didSelect, destination: { TodoItemScreen().environmentObject(item)
                        })
                }
            }
            .toolbar(content: {
                Button(action: {
                    todoList.items.append(TodoItem(title: "New Item", priority: .low))
                }, label: {
                    Image(systemName: "plus")
                })
            })
            .navigationTitle("Todo-list")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListScreen()
    }
}
