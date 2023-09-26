//
//  Assignment2_TodoListAppApp.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//

import SwiftUI

@main
struct Assignment2_TodoListAppApp: App {
    var body: some Scene {
        WindowGroup {
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
}
