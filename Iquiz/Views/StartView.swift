import SwiftUI

struct StartView: View {
    var viewModel: QuizViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                CustomText(text: " 📽 CINEMA QUIZ")
                ImageView()
                NavigationLink(destination:Quiz()) {
                    ButtonView(text: "✨ START", handle: viewModel.fetchQuestions)
                }
                NavigationLink(destination:Ranking(viewModel: viewModel, ranking: rankingMock)) {
                    ButtonView(text: "🏁 RANKING", handle: viewModel.fetchRanking)
                }
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }

    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(viewModel: QuizViewModel())
    }
}
