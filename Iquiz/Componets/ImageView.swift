import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("cinema")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
