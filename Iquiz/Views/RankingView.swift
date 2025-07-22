import SwiftUI

struct Player: Identifiable {
    var id: Int
    var name: String
    var score: Int
}

struct RankingView: View {
    @ObservedObject var viewModel: QuizViewModel
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
                .accessibilityLabel("Título del ranking")
                .accessibilityValue("Ranking de puntuaciones")

            Spacer()

            if viewModel.ranking.isEmpty {
                EmptyRankingView()
            } else {
                List(viewModel.ranking.indices, id: \.self) { index in
                    let score = viewModel.ranking[index]
                    HStack {
                        Text(medalImageOrNumber(for: index + 1))
                            .font(.body)
                            .frame(width: 30, alignment: .center)
                            .accessibilityLabel("Posición")
                            .accessibilityValue("Posición \(index + 1)")

                        Text(score.name)
                            .font(.system(size: 20))
                            .foregroundColor(Color.black.opacity(0.5))
                            .accessibilityLabel("Nombre del jugador")
                            .accessibilityValue(score.name)
                        Spacer()
                        Text("\(score.score)")
                            .font(.body)
                            .foregroundColor(Color.black.opacity(0.6))
                            .accessibilityLabel("Puntuación")
                            .accessibilityValue("\(score.score) puntos")
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Jugador \(index + 1)")
                    .accessibilityValue("\(score.name) con \(score.score) puntos")
                }
                .padding(.horizontal, 8)
                .listStyle(.plain)
                .accessibilityIdentifier("ranking_list")
                .accessibilityLabel("Lista del ranking")
            }

            ButtonView(text: "🍿 Play again") {
                viewModel.goToInitial()
            }
            .accessibilityIdentifier("play_again_button")
            .accessibilityLabel("Jugar de nuevo")
            .accessibilityHint("Inicia una nueva partida")

            ButtonView(text: "🗑️ Clean ranking") {
                if (!viewModel.ranking.isEmpty) {
                    showingAlert = true
                }
            }
            .accessibilityIdentifier("clean_ranking_button")
            .accessibilityLabel("Limpiar ranking")
            .accessibilityHint("Elimina todas las puntuaciones del ranking")
            .conditionalShow(!viewModel.ranking.isEmpty)
            
            Spacer()
        }
        .padding(16)
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Delete Ranking"),
                message: Text("Are you sure you want to delete the ranking? \n This action cannot be undone."),
                primaryButton: .destructive(Text("Delete")) {
                    viewModel.clearRanking()
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

#Preview {
    RankingView(viewModel: QuizViewModel())
}
