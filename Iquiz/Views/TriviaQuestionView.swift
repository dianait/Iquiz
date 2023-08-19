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

            Spacer()
        }
        .padding()
    }

    struct AnswerButton: View {
        let answer: Answer
        @Binding var showCorrectAnswer: Bool
        let action: () -> Void

        var buttonColor: Color {
            if showCorrectAnswer {
                return answer.isCorrect ? Color.green.opacity(0.6) : Color.red.opacity(0.6)
            } else {
                return Color.clear
            }
        }

        var body: some View {
            Button(action: action) {
                Text(answer.text)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(buttonColor)
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        }
                    )
            }
        }
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
