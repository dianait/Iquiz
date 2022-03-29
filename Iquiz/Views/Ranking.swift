import SwiftUI

struct Ranking: View {
    var viewModel: QuizViewModel
    @State var ranking: [Score]
    
    var body: some View {
        VStack {
            HStack{
                CustomText(text: "🏁 Ranking")
                if self.ranking != [] {
                    Button("🚮"){
                        viewModel.eraseRanking()
                        self.ranking = []
                    }
                }
            }
           
            ScrollView{
                if self.ranking == [] {
                    CustomText(text: "There is no one in the ranking yet. Are you ready? 👇")
                }
                ForEach(self.ranking, id: \.self) { item in
                    RowView(name: item.name, score: item.score)
                    Divider()
                }
            }
         
            ButtonView(text: "PLAY AGAIN", handle: {
                viewModel.state = .initial
            })
            Spacer()
        }
      
    }
}

struct Ranking_Previews: PreviewProvider {
    static var previews: some View {
        Ranking(viewModel: QuizViewModel(), ranking: rankingMock)
    }
}



