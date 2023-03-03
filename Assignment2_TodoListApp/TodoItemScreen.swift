//
//  TodoItemScreen.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoItemScreen: View {
    
    @EnvironmentObject var selectedItem: TodoItem
    
    @Environment(\.dismiss) private var dismiss // OPTIONAL, use this to dismiss a current view. Call dismiss().
    
    
    /*
     TODO (variables [min. 1])
     */
    
    var body: some View {
        NavigationStack {
            TextField("Title", text: $selectedItem.title)
                .textFieldStyle(.roundedBorder)
                .padding(.leading)
                .padding(.trailing)
                .navigationTitle("Edit Item")
            Spacer()
        }
        
    }
}

struct TodoItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemScreen()
    }
}
