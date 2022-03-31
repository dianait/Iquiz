import SwiftUI

struct StartView: View {
    var viewModel: QuizViewModel
    
    var body: some View {
            VStack{
                CustomText(text: "🎞 MOVIE QUIZ")
                ImageView()
                Button("✨ START"){
                    viewModel.suffledQuestions()
                }.font(.system(.title2, design: .monospaced))
                    .frame(width: 400, height: 50)
                    .border(Color.blue)
                Button("🏁 RANKING"){
                    viewModel.gotoRanking()
                }.font(.system(.title2, design: .monospaced))
                    .frame(width: 400, height: 50)
                    .border(Color.blue)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
