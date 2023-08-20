import SwiftUI

struct Quiz: View {
    @StateObject var viewModel = QuizViewModel()
var body: some View {
    VStack{
        switch viewModel.state {
        case .initial:
            StartView(viewModel: viewModel)
        case .playing(let play):
            Question(play: play, viewModel: viewModel)
        case .saveData(let userScore):
            FormView(viewModel: viewModel, score: userScore)
        case .finish(let scoreArray):
            RankingView(viewModel: viewModel, ranking: scoreArray)
        }
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz()
    }
  }
}
