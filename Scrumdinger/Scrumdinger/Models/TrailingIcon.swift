//stylistic elements of label
import SwiftUI

struct TrailingIcon: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIcon {
    static var trailingIcon: Self { Self()}
}
