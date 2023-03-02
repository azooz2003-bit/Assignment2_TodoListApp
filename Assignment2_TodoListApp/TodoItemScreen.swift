//
//  TodoItemScreen.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

struct TodoItemScreen: View {
    
    /*
     TODO (variables [min. 1])
     */
    @State var item: TodoItem
//    @State var title = ""
//
//    init(item: TodoItem){
//        self.item = item
//        self.title = item.title
//    }
    
    var body: some View {
        VStack{
            TextField(item.title,text: $item.title)
        Button("Complete") {
            item.complete = true
        }}
    }
}

struct TodoItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemScreen(item: TodoItem(title:"Test"))
    }
}
