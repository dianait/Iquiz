import XCTest
@testable import Iquiz

final class QUizViewModelTests: XCTestCase {
    var viewModel: QuizViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = QuizViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testEraseRanking() {
        // Given
           viewModel.ranking = [
               Score(name: "PLAYER1", score: 123),
               Score(name: "PLAYER2", score: 45),
               Score(name: "PLAYER3", score: 34)
           ]
           
        // When
           viewModel.eraseRanking()
        
        // Then
           XCTAssert(viewModel.ranking.isEmpty)
       }

}
