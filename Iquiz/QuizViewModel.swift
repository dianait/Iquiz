import Foundation
import SwiftUI

struct Score: Hashable {
    let name: String
    let score: String
}

enum QuizState {
    case initial
    case playing(Play)
    case finish([Score])
    case failed(Error)
}

struct Play {
    let name: String = "Diana"
    let questions: [TrivialQuestion]
    var score: Int = 0
    var index: Int = 0
    let NUM_QUESTIONS = 1
}

class QuizViewModel: ObservableObject {
    var questions: [TrivialQuestion] = []
    @Published var state: QuizState = .initial

    func fetchQuestions() {
        self.questions = getTrivial()
        self.state = .playing(Play(questions: self.questions))
    }
}
