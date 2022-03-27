import SwiftUI

struct RowView: View {
    let name: String
    let score: String
    
    var body: some View {
        HStack{
            CustomText(text: "😊 \(name)")
            CustomText(text: "🎖\(score)")
        }
        .frame(maxWidth: .infinity)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(name: "Diana", score: "345")
    }
}
