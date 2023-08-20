import SwiftUI

struct ArcadeNameEntry: View {
    @State private var letter1: String = ""
    @State private var letter2: String = ""
    @State private var letter3: String = ""
    var viewModel: QuizViewModel
    @State var ranking: [Score]
    @State var score: Score

    init(viewModel: QuizViewModel, score: Score, ranking: [Score]) {
        self.viewModel = viewModel
        self.score = score
        self.ranking = ranking
    }

    var isButtonEnabled: Bool {
        return letter1.count == 1 && letter2.count == 1 && letter3.count == 1
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("🎰 Enter Your Initials...")
                .font(.title2)
                .fontWeight(.light)

            HStack(spacing: 20) {
                SingleLetterTextField(text: $letter1)
                SingleLetterTextField(text: $letter2)
                SingleLetterTextField(text: $letter3)
            }

            Button("💾 SAVE") {
                self.score.name = "\(letter1).\(letter2).\(letter3)"
                self.ranking = viewModel.sortRanking(score: score)
                self.viewModel.state = .finish(self.ranking)
            }
            .padding(.horizontal, 30)
              .padding(.vertical, 10)
              .foregroundColor(isButtonEnabled ? Color.gray.opacity(1) : Color.gray.opacity(0.4))
              .background(
                  RoundedRectangle(cornerRadius: 15)
                    .fill(isButtonEnabled ? .clear : Color.gray.opacity(0.2))
              )
              .overlay(
                  RoundedRectangle(cornerRadius: 15)
                      .stroke(isButtonEnabled ? Color.gray.opacity(1) : Color.gray.opacity(0.3), lineWidth: 1)
              )
              .disabled(!isButtonEnabled)
          }
          .padding()
    }
}

struct ArcadeNameEntry_Previews: PreviewProvider {
    static var score = Score(name: "", score: 45)
    static var previews: some View {
        ArcadeNameEntry(
            viewModel: QuizViewModel(),
            score: score,
            ranking: [score]
        )
            .previewLayout(.sizeThatFits)
    }
}
