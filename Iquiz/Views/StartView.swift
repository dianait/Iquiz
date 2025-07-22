import SwiftUI

struct StartView: View {
    var viewModel: QuizViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("🎞 MOVIE QUIZ")
                .font(.title)
                .fontWeight(.light)

            ImageView(name: "cinema")

            ButtonView(text: "✨START") {
                viewModel.shuffledQuestions()
            }

            ButtonView(text: "🏁 RANKING") {
                viewModel.gotoRanking()
            }
            .accessibilityIdentifier("ranking_button")
        }
        .padding()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(viewModel: QuizViewModel())
    }
}
