import Foundation

//create struct with necessary scrum variables that user wants to see
struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
}

//sample data
extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "UI", attendees: ["Jess", "Nick", "Winston", "Schmidt"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "Backend", attendees: ["Lorelai", "Rory", "Jess", "Logan", "Lane"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Project management", attendees: ["Lara Jean", "Peter"], lengthInMinutes: 5, theme: .poppy)
    ]
}
