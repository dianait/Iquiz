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
        if ranking.isEmpty { return 1 }
        return viewModel.sortRanking(score: score).firstIndex(where: { $0 == score }) ?? 3
    }

    var body: some View {
        VStack {

            Spacer()

            HStack {
                Text("Your score: ")
                    .font(.title)
                    .fontWeight(.light)
                Text("\(score.score)")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .accessibilityLabel("Tu puntuación")
            .accessibilityValue("\(score.score) puntos")

            HStack {
                Text("🎉 You got ").font(.title3)
                Text("\(userRank.ordinal)").bold().font(.title3)
                Text(" place").font(.title3)
            }
            .accessibilityLabel("Posición en el ranking")
            .accessibilityValue("\(userRank.ordinal) lugar")

            Text(medalImageOrNumber(for: userRank))
                .font(.system(size: 150))
                .accessibilityLabel("Medalla de posición")
                .accessibilityValue("Posición \(userRank)")

            ArcadeNameEntry(viewModel: viewModel, score: score)

            Spacer()
        }
        .accessibilityElement(children: .contain)
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
