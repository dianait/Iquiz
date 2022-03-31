import Foundation
import SwiftUI

struct Answer: Hashable {
    let text: String
    let isCorrect: Bool
}
struct TrivialQuestion {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let answers: [Answer]
}

let answersMock = [
    Answer(text: "Steven Spielberg", isCorrect: true),
    Answer(text: "Stanley Kubrick", isCorrect: false),
    Answer(text: "Tim Burton", isCorrect: false),
]
let trivialQuestionMock = TrivialQuestion(category: "Entertainment: Film",
                                          type: "multiple",
                                          difficulty: "easy",
                                          question: "Who directed E.T. the Extra-Terrestrial (1982)?",
                                          correct_answer: "Steven Spielberg",
                                          answers: answersMock)

class API {
    var questions : [TrivialQuestion] = []

    init(){
        self.questions = self.getTrivial()
    }
    
    private func getTrivial() ->  [TrivialQuestion] {
        var returnQuestion: [TrivialQuestion] = []
       
        
        if let path = Bundle.main.path(forResource: "trivial", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                     let questions = jsonResult["results"] as? [AnyObject] {
                      for q in questions {
                          var answers: [Answer] = []
                          let category = q["category"]!! as! String
                          let question = q["question"]!! as! String
                          let type = q["type"]!! as! String
                          let difficulty = q["difficulty"]!! as! String
                          let correct_answer = q["correct_answer"]!! as! String
                          let incorrect_answers = q["incorrect_answers"]!! as! [String]
                          
                          answers.append(Answer(text: correct_answer, isCorrect: true))
                          
                          for ans in incorrect_answers {
                              let currentAnswer = Answer(text: ans, isCorrect: false)
                              answers.append(currentAnswer)
                          }
            
                          returnQuestion.append(
                            TrivialQuestion(category: category,
                                            type: type, difficulty: difficulty, question: question, correct_answer: correct_answer, answers: answers.shuffled()))
                         }
                        return returnQuestion
                  }
              } catch {
                  print("Invalid filename/path.")
              }
        }
        return returnQuestion
    }
    
}


