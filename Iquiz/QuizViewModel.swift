import Foundation
import SwiftUI

struct Score {
    let name: String
    let score: String
}

struct Result {
    let top10: [Score]
}

enum QuizState {
    case initial
    case playing(Play)
    case finish(Result)
    case failed(Error)
}

struct Play {
    let name: String = "Player1"
    let questions: [TrivialQuestion]
    var score: Int = 0
    var index: Int = 0
}

class QuizViewModel: ObservableObject {
    var questions: [TrivialQuestion] = []
    @Published var state: QuizState = .initial

    func fetchQuestions() {
        self.questions = getTrivial()
        self.state = .playing(Play(questions: self.questions))
    }
}
