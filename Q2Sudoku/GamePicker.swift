import SwiftUI

//this page is dedicated to allowing users the ability to choose their difficulty level
struct GamePicker: View {
    //@State private var gamePick:GamePicker
    @State private var game:String = "Sudoku"
    var body: some View {
        Text("Howdy!")
            .font(.largeTitle)
        Image(systemName:"hand.thumbsup")
            .imageScale(.large)
            .padding()
        Text("What level of difficulty would you like to play on?")
        TextField("Game", text:$game)
            .padding()
        //VStack {
            //Picker("Select game", selection: $gamePick)
            
        //}
    }
}

#Preview{
    GamePicker()
}
