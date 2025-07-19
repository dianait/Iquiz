import SwiftUI

struct FormView: View {
    var viewModel: QuizViewModel
    @State var score: Score
    @State var ranking: [Score] = []
//    TODO: Get the position on the ranking
//    @State private var userRank: Int = 3
    let medal: [Int: String] = [1: "🥇", 2: "🥈", 3: "🥉"]


    func medalImageOrNumber(for rank: Int) -> String {
         return medal[rank] ?? "\(rank)"
     }

    var userRank: Int {
        if (ranking.isEmpty) { return 1 }
        return viewModel.sortRanking(score: score).firstIndex(where: { $0 == score }) ?? 3
    }

    var body: some View {
        VStack {

            Spacer()

            Text("Your score: ")
                .font(.title)
                .fontWeight(.light) +
            Text("\(score.score)")
                .font(.title)
                .fontWeight(.bold)

            Text("🎉 You got ").font(.title3) +
            Text("\(userRank.ordinal)").bold().font(.title3) +
            Text(" place")
                .font(.title3)

            Text(medalImageOrNumber(for: userRank))
                .font(.system(size: 150))

            ArcadeNameEntry(viewModel: viewModel, score: score)
            
            Spacer()
        }
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
