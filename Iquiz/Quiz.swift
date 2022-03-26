import SwiftUI

struct Quiz: View {
    @StateObject var viewModel = TrivialViewModel()
    
    var body: some View {
        
        VStack {
                 switch viewModel.state {
                 case .initial:
                     Color.clear
                         .onAppear {
                             viewModel.fetchQuestions()
                         }
                 case .loaded(let play):
                     Question(questions: play.questions)
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
