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
    
    var body: some View {
        NavigationView{
            Text("To-do").font(Font.largeTitle).fontWeight(Font.Weight.bold)
        }.navigationTitle("To-do")
        VStack{
            Text("To-do")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListScreen()
    }
}
