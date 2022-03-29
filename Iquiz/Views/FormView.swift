import SwiftUI

struct FormView: View {
    var viewModel: QuizViewModel
    @State var score: Score
    @State private var username: String = ""
    @State var ranking: [Score] = []
    
    var body: some View {
        VStack {
            ImageView()
            ScoreView(score: score.score)
            TextField("Your name", text: self.$username)
                .padding()

            ButtonView(text: "CONTINUE", handle: {
                if username != "" {
                    self.score.name = username
                    self.ranking = viewModel.sortRanking(score: score)
                    self.viewModel.state = .finish(self.ranking)
                }
               
            })
                Spacer()
        }

       
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(viewModel: QuizViewModel(), score: Score(name: "Player1", score: 0), ranking: rankingMock)
    }
}
