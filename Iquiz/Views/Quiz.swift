import SwiftUI

struct Quiz: View {
    @StateObject var viewModel = QuizViewModel()
    
var body: some View {
    VStack{
        switch viewModel.state {
        case .initial:
            UserView(viewModel: viewModel)
        case .playing(let play):
            Question(viewModel: viewModel, play: play)
        case .saveData(let userScore):
            FormView(viewModel: viewModel, score: userScore)
        case .finish(let scoreArray):
            Ranking(viewModel: viewModel, ranking: scoreArray)
        case .failed(_):
            Text("Something failed")
        }
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz()
    }
  }
}
