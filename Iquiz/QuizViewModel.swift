import Foundation
import SwiftUI

struct Score: Codable, Hashable {
    var name: String
    let score: Int
}

enum QuizState {
    case initial
    case playing(Play)
    case saveData(Score)
    case finish([Score])
}

struct Play {
    let name: String = "Player 1"
    let questions: [TrivialQuestion]
    var score: Int = 0
    var index: Int = 0
    let NUM_QUESTIONS = 1
}

let rankingMock = [
    Score(name: "PLAYER1", score: 123),
    Score(name: "PLAYER2", score: 45),
    Score(name: "PLAYER3", score: 34)
]

class QuizViewModel: ObservableObject {
    var questions: [TrivialQuestion] = []
    @Published var state: QuizState = .initial
    @State var ranking: [Score] = []
    
    func fetchQuestions() {
        let questionsUnsorted = getTrivial()
        self.questions = questionsUnsorted.shuffled()
        self.state = .playing(Play(questions: self.questions))
    }
    
    func fetchRanking() {
        self.state = .finish(getRanking())
    }
    
    func sortRanking(score: Score) -> [Score] {
        var rank = getRanking()
        rank.append(score)
        var rankSorted: [Score] = rank.sorted(by: { $0.score > $1.score })
        rankSorted.remove(at: 10)
        return rankSorted
    }
}
