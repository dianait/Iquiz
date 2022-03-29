import Foundation
import SwiftUI

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
    var index: Int = 1
    let NUM_QUESTIONS = 10
}

class QuizViewModel: ObservableObject {
    @Published var state: QuizState = .initial
    var questions: [TrivialQuestion] = []
    var ranking: [Score] = []
    let storage: StorageController
    let api: API

    init(){
        self.storage = StorageController()
        self.api = API()
        self.ranking = storage.ranking
        self.questions = api.questions
    }
        
    func suffledQuestions() {
        let questionUnsorted =  self.questions.shuffled()
        self.state = .playing(Play(questions:questionUnsorted))
    }
    
    func gotoRanking() {
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
