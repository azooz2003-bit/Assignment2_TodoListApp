//
//  ContentView.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject var todos: TodoItemsViewModel = TodoItemsViewModel()
        
    @State var newItem: String = ""
    
    var body: some View {
        
        NavigationStack {
            
            
            VStack {
                
                Text("My Todos").font(.largeTitle).bold().fontDesign(.rounded)
                
                ScrollView {
                    ForEach(todos.items, id: \.self.id) { item in
                        
                        NavigationLink(destination: {
                            TodoItemScreen().environmentObject(item)
                        }, label: {
                            Text(item.text).foregroundColor(.black)
                                .padding(.vertical)
                                .frame(width: 300, height: 50)
                                .background(content: {Color.blue})
                                .cornerRadius(5)
                        })
                        
                        
                    }
                    
                }.padding(.top, 30)
                
                
                HStack {
                    TextField("Please enter a new todo item.", text: $newItem)
                    
                    Button(action: {
                        
                        let item = TodoItem(text: newItem)
                        todos.appendItem(item: item)
                        newItem = ""
                        
                    }, label: {
                        Circle()
                            .foregroundColor(.blue)
                            .overlay(content: {
                            Image(systemName: "play.fill")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }).frame(width: 50, height: 50)
                        
                    })
                }.padding(.horizontal, 15)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
