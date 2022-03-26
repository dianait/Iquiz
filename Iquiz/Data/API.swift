import Foundation
import SwiftUI

struct TrivialQuestion {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    var incorrect_answers: [String]

}

let trivialQuestionMock = TrivialQuestion(category: "Entertainment: Film", type: "multiple", difficulty: "easy", question: "Who directed &quot;E.T. the Extra-Terrestrial&quot; (1982)?", correct_answer: "Steven Spielberg", incorrect_answers: ["Stanley Kubrick", "James Cameron", "Tim Burton"])

func getTrivial() ->  [TrivialQuestion] {
    var returnQuestion: [TrivialQuestion] = []
    if let path = Bundle.main.path(forResource: "trivial", ofType: "json") {
        do {
              let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
              let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
              if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                 let questions = jsonResult["results"] as? [AnyObject] {
                  for q in questions {
                      let category = q["category"]!! as! String
                      let question = q["question"]!! as! String
                      let type = q["type"]!! as! String
                      let difficulty = q["difficulty"]!! as! String
                      let correct_answer = q["correct_answer"]!! as! String
                      let incorrect_answers = q["incorrect_answers"]!! as! [String]
                      
                      returnQuestion.append(
                        TrivialQuestion(category: category,
                                        type: type, difficulty: difficulty, question: question, correct_answer: correct_answer, incorrect_answers: incorrect_answers))
                     }
                    return returnQuestion
              }
          } catch {
              print("Invalid filename/path.")
          }
    }
    return returnQuestion
}


