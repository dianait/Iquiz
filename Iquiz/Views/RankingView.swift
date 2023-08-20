import SwiftUI

struct Player: Identifiable {
    var id: Int
    var name: String
    var score: Int
}

struct RankingView: View {
    var viewModel: QuizViewModel
    @State var ranking: [Score]
    let medal: [Int: String] = [1: "🥇", 2: "🥈", 3: "🥉"]

    func medalImageOrNumber(for rank: Int) -> String {
         return medal[rank] ?? "\(rank)"
     }

    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Text("🏁 Ranking")
                .font(.title)
                .fontWeight(.ultraLight)

            Spacer()

            ForEach(ranking.indices, id: \.self) { index in
                HStack {

                    Text(medalImageOrNumber(for: index + 1))
                    .font(.body)
                    .frame(width: 30, alignment: .center)

                    Text(ranking[index].name)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black.opacity(0.5))
                    Spacer()
                    Text("\(ranking[index].score)")
                        .font(.body)
                        .foregroundColor(Color.black.opacity(0.6))
                }
            }.padding(.horizontal, 8)


            ButtonView(text: "🍿 Play again") {
                viewModel.state = .initial
            }
            
            Spacer()
        }
        .padding(16)

    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView(
            viewModel: QuizViewModel(),
            ranking: generateRandomPlayers(count: 10))
    }
}
