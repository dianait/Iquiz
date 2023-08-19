import SwiftUI

struct FormView: View {
    var viewModel: QuizViewModel
    @State var score: Score
    @State var ranking: [Score] = []
//    TODO: Get the position on the ranking
    @State private var userRank: Int = 3
    
    var body: some View {
        VStack {

            Spacer()

            Text("Your score: ")
                .font(.title)
                .fontWeight(.light) +
            Text("\(score.score)")
                .font(.title)
                .fontWeight(.bold)

            rankImage()
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            Text("🎉 You got ").font(.title3) +
            Text("\(userRank.ordinal)").bold().font(.title3) +
            Text(" place")
                .font(.title3)

            Divider()

            ArcadeNameEntry(viewModel: viewModel,
                            score: score,
                            ranking: ranking
            )
            
            Spacer()
        }
    }

    func rankImage() -> Image {
        return Image(systemName: "\(userRank).circle.fill")
    }
}

extension Int {
    var ordinal: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

struct FormView_Previews: PreviewProvider {
    static let score = Score(name: "Diana", score: 34)
    static var previews: some View {
        FormView(
            viewModel: QuizViewModel(),
            score: score)
    }
}
