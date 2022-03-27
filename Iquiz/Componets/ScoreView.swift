import SwiftUI

struct ScoreView: View {
    let score: Int
    
    var body: some View {
        CustomText(text: "🎬 SCORE: \(score)")
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 344)
    }
}
