import SwiftUI

struct ScoreView: View {
    let score: Int
    
    var body: some View {
        CustomText(text: "🎬 SCORE: \(score)")
    }
}
