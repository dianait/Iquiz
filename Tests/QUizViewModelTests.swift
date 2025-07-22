import XCTest

@testable import Iquiz

final class QuizViewModelTests: XCTestCase {
    var viewModel: QuizViewModel!

    override func setUp() {
        super.setUp()
        viewModel = QuizViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testClearRanking() {
        // Given
        viewModel.ranking = [
            Score(name: "PLAYER1", score: 123),
            Score(name: "PLAYER2", score: 45),
            Score(name: "PLAYER3", score: 34),
        ]

        // When
        viewModel.clearRanking()

        // Then
        XCTAssert(viewModel.ranking.isEmpty)
    }
    
    func testStateTransitions() {
        // Given
        XCTAssertEqual(viewModel.state, .initial)
        
        // When - Start new game
        viewModel.startNewGame()
        
        // Then - Should transition to loading then playing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.viewModel.state, .playing)
        }
    }
    
    func testGoToRanking() {
        // Given
        XCTAssertEqual(viewModel.state, .initial)
        
        // When
        viewModel.goToRanking()
        
        // Then
        XCTAssertEqual(viewModel.state, .ranking)
    }
    
    func testGoToInitial() {
        // Given
        viewModel.goToRanking()
        XCTAssertEqual(viewModel.state, .ranking)
        
        // When
        viewModel.goToInitial()
        
        // Then
        XCTAssertEqual(viewModel.state, .initial)
    }

}
