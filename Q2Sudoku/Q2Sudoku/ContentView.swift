
import SwiftUI

//an arrray defining the games users can choose from
var games: [Games] =
[.init(name: "Sudoku", color: .purple, imageName: "number.square"),
 .init(name: "Chess", color: .blue, imageName: "number.square")]


struct ContentView: View {
    @State private var path: [Games] = []
    var body: some View {
        //allow path for each game page
        NavigationStack (path: $path){
            List {
                Section("Games"){
                    ForEach(games , id: \.name){
                        game in
                        NavigationLink(value: game) {
                            Label(game.name,
                                  systemImage: game.imageName)
                            .foregroundColor(game.color)
                        }
                    }
                }
                }
            }
            
            //modifier for the list not the navigation title
            .navigationTitle("MyGames")
            .navigationDestination(for: Games.self) { game in
                ZStack{
                    game.color.ignoresSafeArea()
                    Label(game.name, systemImage: game.imageName)
                        .font(.largeTitle)
                        .bold()
                }
            }
           
        }
}


#Preview {
    ContentView()
}

//create structure to make games hashable
struct Games:Hashable {
    let name: String
    let color: Color
    let imageName: String
}


