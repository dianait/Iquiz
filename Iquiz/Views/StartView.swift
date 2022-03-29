import SwiftUI

struct StartView: View {
    var viewModel: QuizViewModel
    @State private var username: String = ""
    
    var body: some View {
            VStack{
                ImageView()
                    ButtonView(text: "✨ START", handle: viewModel.fetchQuestions)
                    ButtonView(text: "🏁 RANKING", handle: viewModel.gotRanking)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            

    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(viewModel: QuizViewModel())
    }
}
