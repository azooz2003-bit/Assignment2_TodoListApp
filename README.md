# Assignment 2 - Todolist App

The main goal of this assignment is to test your SwiftUI knowledge while ensuring that you're able to adhere to a set of conventions. You have complete control over the design of this sample app, however you must implement the app using the instructions below. Try to be creative! The last SwiftUI tutorial should contain hints to help.

## Instructions

1. You must have two accessible screens: Todo-list screen, Todo-list Item View. 
2. Todo-list screen:
  - Has the header text "Todo-list".
  - Will contain all the tappable todo items added by some user. Tapping on the item should navigate the user to the Todo-list Item View with information regarding this particular item.
  - Has functionality enabling the user to add items (as text) to the todo-list. Hint: the list should be updated **the moment** a user adds the item.
4. Todo-list Item screen:
  - Must contain the text of that to-do item.
  - Has functionality enabling the user to edit the text. This can be implemented in several ways on the frontend, we won't restrict you.
  - Optional: display the time this item was added.
5. REQUIRED features to use in implementation, this list is NOT exhaustive:
  - The given classes/structs, which you have to fill out and edit. They're useful for figuring out the approach.
  - @State
  - @StateObject
  - Environment Objects
  - Protocols: ObservableObject, Identifiable
  - ScrollView (for the list of notes) 
  - Navigation
  - Optional: use Enums to aid in implementing optional functionality allowing the user to set a task priority between low-moderate-high.

## Git and Github Tips

- To create your own branch, open this menu, **make sure there's a checkmark next to main** as below, then type your name into the input box and click on the created button below it.
<img width="453" alt="CleanShot 2023-02-27 at 17 26 04@2x" src="https://user-images.githubusercontent.com/67667005/221700294-ed5094cf-9ae1-4e43-9582-808746920d63.png">

- To clone the repo, go to Xcode and click on "Clone an existing project", then paste this page's URL.

- You can commit and push to your OWN branch as many times as you want, you can do this easily via Xcode simply click on commit first. Once you're done with that, click on push, and make sure you're pushing to YOUR branch.
<img width="1369" alt="CleanShot 2023-02-27 at 17 40 59@2x" src="https://user-images.githubusercontent.com/67667005/221702410-31e842a9-e9d3-42b6-a103-109e58a97c48.png">
