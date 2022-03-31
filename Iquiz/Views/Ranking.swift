import SwiftUI

struct Ranking: View {
    var viewModel: QuizViewModel
    @State var ranking: [Score]
    
    var body: some View {
        VStack {
            CustomText(text: "🏁 Ranking")
            ScrollView{
                if self.ranking == [] {
                    CustomText(text: "There is no one in the ranking yet. Are you ready? 👇")
                }
                ForEach(self.ranking, id: \.self) { item in
                    RowView(name: item.name, score: item.score)
                    Divider()
                }
            }
            Button("PLAY AGAIN"){
                viewModel.state = .initial
            }
            Spacer()
        }
    }
}



