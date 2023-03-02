//
//  TodoItems.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import Foundation

class TodoItems: ObservableObject /*  TODO (protocol) */ {
    
    /*
     TODO (variables [min. 1] + initializer)
     Hint: The purpose of this class is to store a collection of TodoItem objects representing the added items. Do you know why? (has to do with each todo item's state)
     */
    @Published var items: [TodoItem]
    init() {
        self.items = []
        //go into User Defaults, try getting items. If null, initialize as empty array
        if let data = UserDefaults.standard.data(forKey: "itemArray") {

            // Create an instance of JSONDecoder
            let decoder = JSONDecoder()

            // Decode the data to an array of MyObject objects
            if let decoded = try? decoder.decode([TodoItem].self, from: data) {

                // Use the decoded array of objects
                self.items = decoded
            }
        } else {
            let encoder = JSONEncoder()

            // Encode the array to a Data object
            if let encoded = try? encoder.encode(items) {

                // Save the encoded data to UserDefaults
                UserDefaults.standard.set(encoded, forKey: "itemArray")
            }
        }
    }
    
    /*
     TODO (functions [min. 1])
     */
    
    func addItem(title: String) {
        items.append(TodoItem(title: title))
        let encoder = JSONEncoder()

           // Encode the updated array to a Data object
           if let encoded = try? encoder.encode(items) {

               // Save the encoded data back to UserDefaults
               UserDefaults.standard.set(encoded, forKey: "itemArray")
           }
    }
    
}
