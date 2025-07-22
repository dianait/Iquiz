import Foundation
import SwiftUI

// MARK: - Quiz State Management
enum QuizState: Equatable {
    case initial
    case loading
    case playing(GameSession)
    case savingScore(GameSession)
    case ranking
    case error(String)
}

// MARK: - Game Session Model
struct GameSession: Equatable {
    let id = UUID()
    let questions: [TrivialQuestion]
    var currentQuestionIndex: Int
    var score: Int
    var timeRemaining: Int
    let totalQuestions: Int
    
    init(questions: [TrivialQuestion]) {
        self.questions = questions
        self.currentQuestionIndex = 0
        self.score = 0
        self.timeRemaining = 30
        self.totalQuestions = 10
    }
    
    var currentQuestion: TrivialQuestion? {
        guard currentQuestionIndex < questions.count else { return nil }
        return questions[currentQuestionIndex]
    }
    
    var isGameFinished: Bool {
        return currentQuestionIndex >= totalQuestions
    }
    
    var progress: Double {
        return Double(currentQuestionIndex) / Double(totalQuestions)
    }
    
    mutating func answerQuestion(isCorrect: Bool, timeBonus: Int) {
        if isCorrect {
            score += timeBonus
        }
        currentQuestionIndex += 1
    }
    
    mutating func updateTimeRemaining(_ time: Int) {
        timeRemaining = time
    }
}

// MARK: - Quiz View Model
@MainActor
class QuizViewModel: ObservableObject {
    @Published private(set) var state: QuizState = .initial
    @Published private(set) var ranking: [Score] = []
    
    private let storage: StorageController
    private let api: API
    private var questions: [TrivialQuestion] = []
    
    init(storage: StorageController = StorageController(), api: API = API()) {
        self.storage = storage
        self.api = api
        self.ranking = storage.ranking
        self.questions = api.questions.shuffled()
    }
    
    // MARK: - State Transitions
    func startNewGame() {
        guard canTransition(to: .loading) else { return }
        
        state = .loading
        
        // Simulate loading if needed
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let shuffledQuestions = self.questions.shuffled()
            let gameSession = GameSession(questions: shuffledQuestions)
            self.state = .playing(gameSession)
        }
    }
    
    func goToRanking() {
        guard canTransition(to: .ranking) else { return }
        state = .ranking
    }
    
    func goToInitial() {
        guard canTransition(to: .initial) else { return }
        state = .initial
    }
    
    func answerQuestion(isCorrect: Bool, timeBonus: Int) {
        guard case .playing(var gameSession) = state else { return }
        
        gameSession.answerQuestion(isCorrect: isCorrect, timeBonus: timeBonus)
        
        if gameSession.isGameFinished {
            state = .savingScore(gameSession)
        } else {
            state = .playing(gameSession)
        }
    }
    
    func updateTimeRemaining(_ time: Int) {
        guard case .playing(var gameSession) = state else { return }
        gameSession.updateTimeRemaining(time)
        state = .playing(gameSession)
    }
    
    func saveScore(name: String) {
        guard case .savingScore(let gameSession) = state else { return }
        
        let score = Score(name: name, score: gameSession.score)
        addScoreToRanking(score)
        state = .ranking
    }
    
    func clearRanking() {
        ranking.removeAll()
        storage.save(ranking: ranking)
    }
    
    // MARK: - Private Methods
    private func addScoreToRanking(_ score: Score) {
        ranking.append(score)
        ranking.sort { $0.score > $1.score }
        
        // Keep only top 10 scores
        if ranking.count > 10 {
            ranking = Array(ranking.prefix(10))
        }
        
        storage.save(ranking: ranking)
    }
    
    private func canTransition(to newState: QuizState) -> Bool {
        switch (state, newState) {
        case (.initial, .loading),
             (.loading, .playing),
             (.playing, .savingScore),
             (.savingScore, .ranking),
             (.ranking, .initial),
             (.initial, .ranking),
             (.error, .initial),
             (.error, .ranking):
            return true
        default:
            return false
        }
    }
    
    // MARK: - Computed Properties
    var currentGameSession: GameSession? {
        switch state {
        case .playing(let session), .savingScore(let session):
            return session
        default:
            return nil
        }
    }
    
    var currentScore: Score? {
        guard case .savingScore(let session) = state else { return nil }
        return Score(name: "Player", score: session.score)
    }
}
