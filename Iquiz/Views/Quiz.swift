import SwiftUI

struct Quiz: View {
    @StateObject var viewModel = QuizViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .initial:
                StartView(viewModel: viewModel)
            case .loading:
                LoadingView()
            case .playing(let gameSession):
                QuestionView(gameSession: gameSession, viewModel: viewModel)
            case .savingScore(let gameSession):
                ScoreFormView(gameSession: gameSession, viewModel: viewModel)
            case .ranking:
                RankingView(viewModel: viewModel)
            case .error(let message):
                ErrorView(message: message) {
                    viewModel.goToInitial()
                }
            }
        }
        .animation(.easeInOut, value: viewModel.state)
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz()
    }
}
