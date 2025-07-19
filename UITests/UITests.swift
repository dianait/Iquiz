import XCTest

final class IquizeUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launchArguments.append("--mockRanking")
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app.terminate()
        app = nil
    }

    @MainActor
    func testCleanRankingScore() throws {
        let rankingButton = app.buttons["ranking_button"]
        rankingButton.tap()
        
        let rankingList = app.collectionViews["ranking_list"]
        XCTAssertEqual(rankingList.cells.count, 3)
        
        let clearButton = app.buttons["clean_ranking_button"]
        clearButton.tap()
        
        let confirmButton = app.buttons["Delete"]
        confirmButton.tap()

        XCTAssertFalse(rankingList.waitForExistence(timeout: 1))
        let emptyViewHeadline = app.staticTexts["empty_ranking_headline"]
        XCTAssert(emptyViewHeadline.waitForExistence(timeout: 1))
    }
}
