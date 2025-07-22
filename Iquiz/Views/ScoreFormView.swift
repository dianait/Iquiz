import SwiftUI

struct ScoreFormView: View {
    let gameSession: GameSession
    let viewModel: QuizViewModel
    
    @State private var letter1: String = ""
    @State private var letter2: String = ""
    @State private var letter3: String = ""
    
    let medal: [Int: String] = [1: "🥇", 2: "🥈", 3: "🥉"]
    
    var isButtonEnabled: Bool {
        return letter1.count == 1 && letter2.count == 1 && letter3.count == 1
    }
    
    var userRank: Int {
        let currentScore = gameSession.score
        let sortedRanking = viewModel.ranking.sorted { $0.score > $1.score }
        return sortedRanking.firstIndex { $0.score <= currentScore } ?? (sortedRanking.count + 1)
    }
    
    func medalImageOrNumber(for rank: Int) -> String {
        return medal[rank] ?? "\(rank)"
    }
    
    var body: some View {
        VStack {
            Spacer()

            HStack {
                Text("Your score: ")
                    .font(.title)
                    .fontWeight(.light)
                Text("\(gameSession.score)")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .accessibilityLabel("Tu puntuación")
            .accessibilityValue("\(gameSession.score) puntos")

            HStack {
                Text("🎉 You got ").font(.title3)
                Text("\(userRank.ordinal)").bold().font(.title3)
                Text(" place").font(.title3)
            }
            .accessibilityLabel("Posición en el ranking")
            .accessibilityValue("\(userRank.ordinal) lugar")

            Text(medalImageOrNumber(for: userRank))
                .font(.system(size: 150))
                .accessibilityLabel("Medalla de posición")
                .accessibilityValue("Posición \(userRank)")

            VStack(spacing: 20) {
                Text("🎰 Enter Your Initials...")
                    .font(.title2)
                    .fontWeight(.light)
                    .accessibilityLabel("Instrucciones")
                    .accessibilityValue("Ingresa tus iniciales")

                HStack(spacing: 20) {
                    SingleLetterTextField(text: $letter1)
                        .accessibilityIdentifier("initial_1")
                        .accessibilityLabel("Primera inicial")
                    SingleLetterTextField(text: $letter2)
                        .accessibilityIdentifier("initial_2")
                        .accessibilityLabel("Segunda inicial")
                    SingleLetterTextField(text: $letter3)
                        .accessibilityIdentifier("initial_3")
                        .accessibilityLabel("Tercera inicial")
                }
                .accessibilityElement(children: .contain)
                .accessibilityLabel("Campo de iniciales")

                Button("💾 SAVE") {
                    let name = "\(letter1).\(letter2).\(letter3)"
                    viewModel.saveScore(name: name)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .foregroundColor(isButtonEnabled ? Color.gray.opacity(1) : Color.gray.opacity(0.4))
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(isButtonEnabled ? .clear : Color.gray.opacity(0.2))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(
                            isButtonEnabled ? Color.gray.opacity(1) : Color.gray.opacity(0.3),
                            lineWidth: 1)
                )
                .disabled(!isButtonEnabled)
                .accessibilityIdentifier("save_button")
                .accessibilityLabel("Guardar puntuación")
                .accessibilityHint(
                    isButtonEnabled
                        ? "Guarda tu puntuación en el ranking"
                        : "Completa las tres iniciales para guardar")
            }
            .padding()
            .accessibilityElement(children: .contain)
            
            Spacer()
        }
        .accessibilityElement(children: .contain)
    }
}

extension Int {
    var ordinal: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

struct ScoreFormView_Previews: PreviewProvider {
    static var previews: some View {
        var gameSession = GameSession(questions: Array(repeating: trivialQuestionMock, count: 10))
        gameSession.score = 150
        
        return ScoreFormView(gameSession: gameSession, viewModel: QuizViewModel())
    }
} 