import SwiftUI

struct RowView: View {
    let name: String
    let score: Int
    
    var body: some View {
        HStack{
            CustomText(text: "😊 \(name)")
                .frame(maxWidth: .infinity, alignment: .leading)
            CustomText(text: "🎖\(String(score))")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
