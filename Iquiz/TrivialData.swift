import Foundation

struct TrivialModel: Decodable {
    let response_code: Int
    let results: [IQuestion]
}

struct IQuestion: Decodable, Equatable {
    let category: String
    let type: String
    let diffculty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}


// MOCK DATA
let questionMock = IQuestion(category: "Film", type: "multiple", diffculty: "easy", question: "question?", correct_answer: "true", incorrect_answers: ["false", "false", "false"])

let trivialModelMock = TrivialModel(response_code: 0, results: [questionMock, questionMock, questionMock])
