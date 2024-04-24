import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Journal")
                .font(.largeTitle)
                .bold()
                .padding(100)
            Image(systemName: "lock")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("How are you?")
                .font(.headline)
            Button("Good") {
                print(Image(systemName: "hand.thumbsUp"))
            }
            .padding()
            Button("Unfortunate"){
                print(Image(systemName: "hand.thumbsDown"))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
