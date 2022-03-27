import Foundation
import SwiftUI

struct Score: Hashable {
    var name: String
    let score: String
}

enum QuizState {
    case initial
    case playing(Play)
    case saveData(Score)
    case finish([Score])
    case failed(Error)
}

struct Play {
    let name: String = "Player 1"
    let questions: [TrivialQuestion]
    var score: Int = 0
    var index: Int = 0
    let NUM_QUESTIONS = 10
}

class QuizViewModel: ObservableObject {
    var questions: [TrivialQuestion] = []
    @Published var state: QuizState = .initial

    func fetchQuestions() {
        self.questions = getTrivial()
        self.state = .playing(Play(questions: self.questions))
    }
    
    func fetchRanking() {
        self.state = .finish(rankingMock)
    }
}
