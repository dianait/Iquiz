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
    @Published var state: QuizState = .initial
    var questions: [TrivialQuestion] = []
    var ranking: [Score] = []
    let storage: StorageController

    init(){
        self.storage = StorageController()
        self.ranking = storage.ranking
        self.questions = getTrivial()
    }
        
    func fetchQuestions() {
        let questionUnsorted =  self.questions.shuffled()
        self.state = .playing(Play(questions:questionUnsorted))
    }
    
    func gotRanking() {
        self.state = .finish(self.ranking)
    }
    
    func sortRanking(score: Score) -> [Score] {
        self.ranking.append(score)
        var rankSorted: [Score] = self.ranking.sorted(by: { $0.score > $1.score })
        while rankSorted.count > 10 {
            rankSorted.removeLast()
        }
        self.ranking = rankSorted
        storage.save(ranking: self.ranking)
        return rankSorted
    }
    
    func eraseRanking() {
        self.ranking.removeAll()
        storage.save(ranking: self.ranking)
    }
}
