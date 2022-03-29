import SwiftUI

struct Ranking: View {
    var viewModel: QuizViewModel
    @State var ranking: [Score]
    
    var body: some View {
        VStack {
            Text("🏁Ranking")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            ScrollView{
                ForEach(self.ranking, id: \.self) { item in
                    RowView(name: item.name, score: item.score)
                    Divider()
                }
            }
         
            ButtonView(text: "TRY AGAIN", handle: {
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



