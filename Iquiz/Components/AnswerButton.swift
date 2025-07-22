import SwiftUI

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
        .buttonStyle(NoOpacityButtonStyle())
    }
}
