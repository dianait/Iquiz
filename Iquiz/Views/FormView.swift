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

            Button("CONTINUE"){
                if username != "" {
                    self.score.name = username
                    self.ranking = viewModel.sortRanking(score: score)
                    self.viewModel.state = .finish(self.ranking)
                }
            }
                Spacer()
        }

       
    }
}
