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
    @ObservedObject var items: TodoItems
    @State var newTask = ""
    @State var numItems: Int
    
    init(items: TodoItems) {
        self.items = items
        self._numItems = State(initialValue: items.items.count)
    }
    
    var body: some View {
        NavigationView{
            VStack{
    //            Text("To-do").font(Font.largeTitle).fontWeight(Font.Weight.bold)
                ScrollView{
                    ForEach(items.items) { item in
                        if (!item.complete){
                            NavigationLink(item.title, destination: TodoItemScreen(item: item))
                        }
                    }.id(numItems)
                }
                HStack{
                    TextField("Task Name", text: $newTask)
                    Button("Add Task"){
                        if (newTask != "")
                        {
                            items.addItem(title: newTask)
                            numItems += 1
                            newTask = ""
                        }
                    }
                }.padding(.horizontal, 15)

            }.navigationTitle("Todo List")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let todoItems = TodoItems()
        TodoListScreen(items: todoItems)
    }
}

