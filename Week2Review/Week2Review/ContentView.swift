//
//  ContentView.swift
//  ConceptsReview
//
//
//Class Notes Review
//2 ways to think of logic: brute force (try all) or backtracking (last successful place)
//check what version you are supporting, update to fix bugs but not past what market has
//update project settings then clean build then build
//downloaded images go into assets
//vectorized pdf means no matter how you compress, loss less for pdf
//@main refers to main thread for application
//thread is when OS allots every app certain things
//refactor is changing name everywhere
//modes: single player, bot, multi player, undetermined
//enumerated data types
//switch looks for instance of something happening and has cases
//instance refers to same structure known as self but Self is not instance it is name of structure and C++ is same idea but known as self pointer
//@state property keeps track of something
//.tag connects

//Intro Notes
//data types: string, double, float, boolean, camel case is small then capital

//if else
//let a = false
//let b = false
//let c = true
//if !a || !b && c
//{
    //also use brackets to group operators
   // print("a or b are false")
//}

//View
//view is a protocol
//contentview is a structure that follows view protocol
//some view means any
import SwiftUI

struct ContentView: View {
    @State private var choice:String = "Heads"
    var coin = "Heads"
    var body: some View {
        VStack {
            Text("Heads or Tails? \(choice)")
            TextField("Coin", text: $choice)
                .padding()
            if (choice == coin)
            {
                Text("Winner!")
                //Image(systemName: "hand.thumbsUp")
                    //.imageScale(.large)
                    //.padding()
            }
            else if (choice == "Tails")
            {
                Text("Try again")
            }
            else
            {
                Text("Please enter valid coin side")
            }
        }
        .background(Color(red: 10, green: 20, blue: 30))
        .padding()
    }
}


#Preview {
    ContentView()
}
