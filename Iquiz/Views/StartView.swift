import SwiftUI

struct StartView: View {
    var viewModel: QuizViewModel

    var body: some View {
                    VStack(spacing: 20) {
                Text("🎞 MOVIE QUIZ")
                    .font(.title)
                    .fontWeight(.light)
                    .accessibilityLabel("Título de la aplicación")
                    .accessibilityValue("Movie Quiz")

                ImageView(name: "cinema")
                    .accessibilityLabel("Imagen de cine")
                    .accessibilityHidden(true)

                ButtonView(text: "✨START") {
                    viewModel.shuffledQuestions()
                }
                .accessibilityIdentifier("start_button")
                .accessibilityLabel("Comenzar el quiz")
                .accessibilityHint("Inicia una nueva partida del quiz de películas")

                ButtonView(text: "🏁 RANKING") {
                    viewModel.gotoRanking()
                }
                .accessibilityIdentifier("ranking_button")
                .accessibilityLabel("Ver ranking")
                .accessibilityHint("Muestra el ranking de mejores puntuaciones")
            }
            .padding()
            .accessibilityElement(children: .contain)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(viewModel: QuizViewModel())
    }
}
