import SwiftUI

struct ContentView: View {
    //set variables
    @State var isFlipping = false
    @State var isHeads = false
    @State var degreesToFlip: Int = 0
    @State var tailsCount: Int = 0
    @State var headsCount: Int = 0
    var body: some View {
        VStack {
            VStack {
                //display count of each side of flips
                Text("Heads: \(headsCount)")
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Tails: \(tailsCount)")
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding()
            Coin(isFlipping: $isFlipping, isHeads: $isHeads)
                .rotation3DEffect(Angle(degrees: Double(degreesToFlip)), axis: (x: CGFloat(0), y: CGFloat(10), z: (CGFloat(0))))
            //allow user to click button to flip the coin
            Button("Flip Coin") {
                flipCoin()
            }
        }
        .padding()
    }
    //flip the coin
    func flipCoin() {
        withAnimation {
            let num = Int.random(in: 5...6)
            if degreesToFlip > 180
            {
                reset()
            }
            degreesToFlip = degreesToFlip + (num + 180)
            headsOrTails()
            isFlipping.toggle()
        }
        //determine flip
        func headsOrTails() {
            let divisible = degreesToFlip / 180
            (divisible % 2) == 0 ? (isHeads = false) : (isHeads = true)
            isHeads == true ? (headsCount += 1) : (tailsCount += 1)
        }
        //reset the coin flips
        func reset() {
            
        }
    }
    //set the view
    struct Coin: View {
        @Binding var isFlipping: Bool
        @Binding var isHeads: Bool
        var body: some View {
            ZStack {
                //create the circles
                Circle()
                    .foregroundColor(isHeads ? .pink : .green)
                    .frame(width:100, height: 100)
                Circle()
                    .foregroundColor(isHeads ? .indigo : .blue)
                    .frame(width: 90, height: 90)
            }
        }
    }
}
    
#Preview {
    ContentView()
}
