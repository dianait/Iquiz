import SwiftUI

struct QuestionNumberView: View {
    @Binding var currentQuestion: Int
    let totalQuestions: Int
    let gradientColors: [Color] = [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]

    var currentQuestionToShow: String {
        let index = currentQuestion + 1
        return "\(index < 10 ? "0" : "")\(index)"
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                .frame(width: 60, height: 60)

            Text("\(currentQuestionToShow)")
                .font(.system(size: 18))
                .foregroundColor(Color.black.opacity(0.7)) +
            Text("/\(totalQuestions)")
                .font(.system(size: 18))
                .foregroundColor(Color.gray.opacity(0.7))


        }
        .accessibilityLabel("Progreso de preguntas")
        .accessibilityValue("Pregunta \(currentQuestion + 1) de \(totalQuestions)")
    }
}

struct QuestionNumberView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionNumberView(currentQuestion: .constant(3), totalQuestions: 10)
    }
}
