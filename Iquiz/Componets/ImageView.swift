import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("cinema")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
