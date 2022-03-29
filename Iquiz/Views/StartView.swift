import SwiftUI

struct StartView: View {
    var viewModel: QuizViewModel
    @State private var username: String = ""
    
    var body: some View {
            VStack{
                CustomText(text: "🎞 MOVIE QUIZ")
                ImageView()
                    ButtonView(text: "✨ START", handle: viewModel.suffledQuestions)
                    ButtonView(text: "🏁 RANKING", handle: viewModel.gotoRanking)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            

    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(viewModel: QuizViewModel())
    }
}
