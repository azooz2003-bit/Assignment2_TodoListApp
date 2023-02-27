//
//  ContentView.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todos: TodoItems = TodoItems()
    
    var body: some View {
        
        
        VStack {
            
            ScrollView {
                let items: [TodoItem] = todos.items

                ForEach(items, id: \.self.id) { item in
                    
                    NavigationLink(item.text, destination: {TodoItemScreen().environmentObject(item)})
                    
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
