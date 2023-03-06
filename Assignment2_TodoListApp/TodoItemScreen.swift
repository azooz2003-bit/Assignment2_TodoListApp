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
    
    var body: some View {
        VStack{
            TextField(item.itemName,text: $item.itemName)
        Button("Done") {
            item.workDone = true
        }}

    }
    
}

//struct TodoItemScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoItemScreen(item: <#TodoItem#>)
//    }
//}
