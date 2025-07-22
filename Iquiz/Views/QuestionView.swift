import SwiftUI

struct QuestionView: View {
    let gameSession: GameSession
    let viewModel: QuizViewModel

    @State private var timeRemaining: Int
    @State private var showCorrectAnswer: Bool = false
    @State private var currentQuestion: TrivialQuestion?

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let TIME_TO_WAIT: Double = 1.0

    init(gameSession: GameSession, viewModel: QuizViewModel) {
        self.gameSession = gameSession
        self.viewModel = viewModel
        self._timeRemaining = State(initialValue: gameSession.timeRemaining)
        self._currentQuestion = State(initialValue: gameSession.currentQuestion)
    }

    private func nextQuestion() {
        showCorrectAnswer = true
        DispatchQueue.main.asyncAfter(deadline: .now() + TIME_TO_WAIT) {
            timeRemaining = 30
            showCorrectAnswer = false
            currentQuestion = gameSession.currentQuestion
        }
    }

    private func handleAnswer(_ selectedAnswer: Int) {
        guard let question = currentQuestion else { return }

        showCorrectAnswer = true
        let isCorrect = question.answers[selectedAnswer].isCorrect
        let timeBonus = timeRemaining

        viewModel.answerQuestion(isCorrect: isCorrect, timeBonus: timeBonus)

        if !gameSession.isGameFinished {
            nextQuestion()
        }
    }

    var scoreToShow: String {
        "\(gameSession.score < 10 ? "00" : "")\(gameSession.score)"
    }

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("🌟 \(scoreToShow)")
                    .font(.title3)
                    .fontWeight(.light)
                    .accessibilityLabel("Puntuación actual")
                    .accessibilityValue("\(gameSession.score) puntos")

                Spacer()

                QuestionNumberView(
                    currentQuestion: .constant(gameSession.currentQuestionIndex),
                    totalQuestions: gameSession.totalQuestions)

                Spacer()

                Text("⏱ \(timeRemaining < 10 ? "0" : "")\(timeRemaining)")
                    .font(.system(.title3, design: .monospaced))
                    .fontWeight(.light)
                    .accessibilityLabel("Tiempo restante")
                    .accessibilityValue("\(timeRemaining) segundos")
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                            viewModel.updateTimeRemaining(timeRemaining)
                        } else {
                            handleAnswer(-1)  // Time's up, wrong answer
                        }
                    }
            }
            .padding(16)

            Spacer()

            if let question = currentQuestion {
                TriviaQuestionView(
                    question: question,
                    showCorrectAnswer: $showCorrectAnswer
                ) { selectedAnswer in
                    handleAnswer(selectedAnswer)
                }
                .padding(8)
            }

            Spacer()

            ButtonView(text: "↩️ go back") {
                viewModel.goToInitial()
            }
            .frame(width: 180)
            .accessibilityIdentifier("go_back_button")
            .accessibilityLabel("Volver al menú principal")
        }
        .onAppear {
            currentQuestion = gameSession.currentQuestion
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var gameSession = GameSession(
        questions: Array(repeating: trivialQuestionMock, count: 40))

    static var previews: some View {
        Group {
            QuestionView(gameSession: gameSession, viewModel: QuizViewModel())
                .previewDisplayName("☀️ Light mode")

            QuestionView(gameSession: gameSession, viewModel: QuizViewModel())
                .preferredColorScheme(.dark)
                .previewDisplayName("🌙 Dark mode")
        }
    }
}
