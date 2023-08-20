import SwiftUI

struct Question: View {
    @State var play: Play
    @State var index: Int = 0
    var COUNTER_TIME: Int = 30
    var viewModel: QuizViewModel
    var TIME_TO_WAIT: Double = 1.0
    @State var timeRemaining: Int = 30
    @State var showCorrectAnswer: Bool = false
    @State var question: TrivialQuestion = trivialQuestionMock
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private func nextQuestion() -> Void {
        self.showCorrectAnswer = true
        DispatchQueue.main.asyncAfter(deadline: .now() + TIME_TO_WAIT) {
            self.timeRemaining = COUNTER_TIME
            self.index += 1
            self.showCorrectAnswer = false
            self.question = play.questions[index]
        }
    }
    
    private func finish() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TIME_TO_WAIT) {
            let currentScore = Score(name: play.name, score: play.score)
            viewModel.state = .saveData(currentScore)
        }
    }
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("🎬 SCORE: \(play.score)")
                    .font(.title3)
                    .fontWeight(.light)
                    .padding(.leading, 16)

                Text( "⏱ \(timeRemaining)")
                    .font(.title3)
                    .fontWeight(.light)
                    .onReceive(self.timer) { _ in
                        if self.timeRemaining > 0 {
                            self.timeRemaining -= 1
                        }
                        else {
                            self.nextQuestion()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
            }
            .padding()

            Spacer()

                TriviaQuestionView(
                    question: self.question,
                    showCorrectAnswer: $showCorrectAnswer) {
                    selectedAnswer in
                    self.showCorrectAnswer = true
                    if self.index == self.play.NUM_QUESTIONS {
                        self.finish()
                        return
                    }
                    if (question.answers[selectedAnswer].isCorrect) {
                        self.play.score += self.timeRemaining
                    }

                    viewModel.state = .loading
                    self.nextQuestion()
                }
                    .padding(8)
            Spacer()

            ButtonView(text: "↩️ go back") {
                viewModel.state = .initial
            }
            .frame(width: 180)

        }
        .onAppear {
            self.question = play.questions[index]
        }
    }
}

struct Question_Previews: PreviewProvider {
    static var play = Play(
        questions: Array(repeating: trivialQuestionMock, count: 40)
    )

    static var previews: some View {
        Group {
            Question(play: play, viewModel: QuizViewModel())
                .previewDisplayName("☀️ Light mode")

            Question(play: play, viewModel: QuizViewModel())
                .preferredColorScheme(.dark)
                .previewDisplayName("🌙 Dark mode")
        }

    }
}


