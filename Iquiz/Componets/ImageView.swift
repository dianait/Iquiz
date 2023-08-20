import SwiftUI

struct ImageView: View {
    let name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
