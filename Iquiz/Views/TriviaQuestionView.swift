import SwiftUI

struct TriviaQuestionView: View {
    let answerOptions: [Answer]
    let questionText: String
    let action: (_ selectedAnswer: Int) -> Void
    @Binding var showCorrectAnswer: Bool

    init(question: TrivialQuestion,
         showCorrectAnswer: Binding<Bool>,
         action: @escaping (_ selectedAnswer: Int) -> Void) {
        self.questionText = question.question
        self.answerOptions = question.answers
        self._showCorrectAnswer = showCorrectAnswer
        self.action = action
    }

    var body: some View {
        VStack(spacing: 20) {
            Text(questionText)
                .font(.title2)
                .fontWeight(.light)
                .multilineTextAlignment(.center)

            ForEach(0..<answerOptions.count, id: \.self) { index in
                AnswerButton(answer: answerOptions[index],
                             showCorrectAnswer: $showCorrectAnswer
                ) {
                    action(index)
                }
            }
        }
        .padding()
    }
}

struct TriviaQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TriviaQuestionView(
                question: trivialQuestionMock,
                showCorrectAnswer: .constant(true)
            ) {_ in }

            TriviaQuestionView(
                question: trivialQuestionMock,
                showCorrectAnswer: .constant(false)
            ) {_ in }
        }

    }
}
