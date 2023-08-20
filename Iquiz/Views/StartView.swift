import SwiftUI

struct StartView: View {
    var viewModel: QuizViewModel
    
    var body: some View {
            VStack(spacing: 20) {
                Text("🎞 MOVIE QUIZ")
                    .font(.title)

                ImageView()

                Button(action: { viewModel.suffledQuestions() }) {
                    button(text: "   ✨START   ") }
                .buttonStyle(PlainButtonStyle())

                Button(action: { viewModel.gotoRanking() }) {
                    button(text: "🏁 RANKING") }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
    }
}

@ViewBuilder func button(text: String) -> some View {
    Text(text)
        .fontWeight(.light)
               .font(.system(size: 16))
               .padding(.horizontal, 30)
               .padding(.vertical, 10)
               .background(
                   RoundedRectangle(cornerRadius: 15)
                       .stroke(Color.gray.opacity(0.5), lineWidth: 1)
               )
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(viewModel: QuizViewModel())
    }
}
