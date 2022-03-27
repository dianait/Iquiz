import SwiftUI

struct FormView: View {
    var viewModel: QuizViewModel
    @State var score: Score
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            ImageView()
            CustomText(text: "What's your name ❓")
            TextField("Your name", text: self.$username)
                .padding()
                .border(Color.blue)

            ButtonView(text: "CONTINUE", handle: {
                if username != "" {
                    self.score.name = username
                    self.viewModel.state = .finish([self.score])
                }
               
            })
                Spacer()
        }

       
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(viewModel: QuizViewModel(), score: Score(name: "Player 1", score: String(0)))
    }
}
