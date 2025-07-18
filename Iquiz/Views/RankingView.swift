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
    @State private var showingAlert = false

    func medalImageOrNumber(for rank: Int) -> String {
         return medal[rank] ?? "\(rank)"
     }

    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Text("🏁 Ranking")
                .font(.title)
                .fontWeight(.ultraLight)

            Spacer()

            if ranking.isEmpty { EmptyRankingView() }

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

            ButtonView(text: "🗑️ Clean ranking") {
                if (!ranking.isEmpty) {
                    showingAlert = true
                }
            }
            .accessibilityIdentifier("clean_ranking_button")
            .conditionalShow(!ranking.isEmpty)
            
            Spacer()
        }
        .padding(16)
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Delete Ranking"),
                message: Text("Are you sure you want to delete the ranking? \n This action cannot be undone."),
                primaryButton: .destructive(Text("Delete")) {
                    viewModel.eraseRanking()
                },
                secondaryButton: .cancel(Text("Cancel"))
            )
        }

    }
}

extension View {
    func conditionalShow(_ condition: Bool) -> some View {
        Group {
            if condition {
                self
            }
        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RankingView(
                viewModel: QuizViewModel(),
                ranking: generateRandomPlayers(count: 10))
            .previewDisplayName("Ranking fill")

            RankingView(
                viewModel: QuizViewModel(),
                ranking: [])
            .previewDisplayName("Ranking empty")
        }

    }
}
