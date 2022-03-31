import SwiftUI

struct StartView: View {
    var viewModel: QuizViewModel
    
    var body: some View {
            VStack{
                CustomText(text: "🎞 MOVIE QUIZ")
                ImageView()
                Button("✨ START"){
                    viewModel.suffledQuestions()
                }
                Button("🏁 RANKING"){
                    viewModel.gotoRanking()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
