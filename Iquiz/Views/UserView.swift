import SwiftUI

struct UserView: View {
    var viewModel: QuizViewModel
    
    var body: some View {
        VStack{
            CustomText(text: " 📽 CINEMA QUIZ")
            Image("cinema")
                .resizable()
                .aspectRatio(contentMode: .fit)
            ButtonView(text: "START", handle: viewModel.fetchQuestions)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: QuizViewModel())
    }
}
