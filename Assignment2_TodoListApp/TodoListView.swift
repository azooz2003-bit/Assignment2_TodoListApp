//
//  ContentView.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 2/27/23.
//
import SwiftUI

struct TodoListView: View {
    
    @StateObject var todos: TodoItems = TodoItems(multipeer: MultipeerManager())
        
    @State var newItem: String = ""
    

    var body: some View {
        
        let multipeer = todos.multipeer
        
        NavigationStack {
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        multipeer.requestOneTodoItem()
                    }, label: {
                        Image(systemName: "dot.radiowaves.left.and.right")
                    })
                    
                    Text("My Todos")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.rounded)
                }
                
                
                ScrollView {
                    ForEach(todos.items, id: \.self.id) { item in
                        
                        
                        ZStack {
                            NavigationLink(destination: {
                                TodoItemScreen().environmentObject(item)
                            }, label: {
                                
                                Text(item.text)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: 300, height: 50)
                                    .background(content: {Color.blue})
                                    .cornerRadius(5)
                                    
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                multipeer.setToBeShared(item: item)
                                multipeer.listRequesters()
                            }, label: {
                                Image(systemName: "square.and.arrow.up")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                            }).offset(x: 120)
                        }
                        
                        
                        
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
