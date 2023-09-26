//
//  ContentView.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoListScreen: View {
    var todoItems: TodoItems
    @State var state: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(todoItems.items) { item in
                        Button {
                            todoItems.select(item: item)
                            state = true
                        } label: {
                            Text(item.title)
                        }.padding(10)
                    }
                }
            }
            .navigationTitle("Todo List 🎉")
        }.navigationDestination(isPresented: $state) {
            TodoItemScreen(item: todoItems.selected!)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListScreen(
            todoItems: TodoItems([
                TodoItem(
                    title: "itemA",
                    desc: "this does things",
                    deadline: "09/26/2023"
                ),
                TodoItem(
                    title: "itemB",
                    desc: "this does things",
                    deadline: "09/26/2023"
                ),
                TodoItem(
                    title: "itemC",
                    desc: "this does things",
                    deadline: "09/26/2023"
                ),
                TodoItem(
                    title: "itemD",
                    desc: "this does things",
                    deadline: "09/26/2023"
                )
                
            ])
        )
    }
}
