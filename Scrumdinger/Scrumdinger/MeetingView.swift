

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            //display progress in a timeline bar form
            ProgressView(value: 5, total: 15)
                .padding()
            HStack{
                VStack(alignment: .leading) {
                    //visual of time passed
                    Text("Seconds Elapsed")
                    //nake text smaller
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                //space in between elapsed and remaining
                Spacer()
                VStack(alignment: .trailing) {
                    //visual of time remaining
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            
            //create circle shape
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                //create forward button
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View {
        MeetingView()
    }
}
