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
    @State var date: Bool = false
    @State var description: Bool = false
    
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
                                
                HStack {
                    Button(action: {
                        date ? ToDoList.sortByDateAsc() : ToDoList.sortByDateDes()
                        date = !date
                    }, label: {
                        Text("Date").frame(width: 100)
                    }).padding(.top)
                        .buttonStyle(.bordered)
                        .tint(.green)
                    
                    Button(action: {
                        description ? ToDoList.sortByDescAsc() : ToDoList.sortByDescDes()
                        description = !description
                    }, label: {
                        Text("Description").frame(width: 100)
                    }).padding(.top)
                        .buttonStyle(.bordered)
                        .tint(.red)
                }
               
                ScrollView {
                    ForEach(self.ToDoList.ToDoList) { item in
                        
                        Button {
                            clickedItem = item
                            clicked = true
                        } label: {
                            Text(item.text)
                                .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        .buttonStyle(.bordered)
                        .tint(item.color)
                    }
                }
            }.navigationDestination(isPresented: $clicked, destination: {
                TodoItemScreen(clicked: $clicked, todoitem: $clickedItem ).environmentObject(ToDoList)
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListScreen()
    }
}
