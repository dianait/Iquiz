import SwiftUI

struct Quiz: View {
    @StateObject var viewModel = QuizViewModel()
    
var body: some View {
    VStack{
        switch viewModel.state {
        case .initial:
            Color.clear
                .onAppear{
                    viewModel.fetchQuestions()
                }
        case .playing(let play):
            Question(play: play)
        case .finish(_):
            Ranking(ranking: rankingMock)
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
