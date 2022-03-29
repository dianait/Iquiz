import SwiftUI

func sortAnswers(correct_answer: String, incorrect_answers: [String]) -> [String] {
    let arrayAnswers = incorrect_answers + [correct_answer]
    let sortAnswers: [String] = arrayAnswers.shuffled()
    return sortAnswers
}

struct Question: View {
    var viewModel: QuizViewModel
    @State var play: Play
    @State var question: TrivialQuestion = trivialQuestionMock
    @State var index: Int = 0
    @State var timeRemaining: Int = 30
    
    
    var body: some View {
        VStack {
            HStack{
                ScoreView(score: play.score).frame(maxWidth: .infinity, alignment: .leading)
                Counter(timeRemaining: $timeRemaining).frame(maxWidth: .infinity, alignment: .trailing)
            }.onAppear{
                    self.question = play.questions[index]
            }
        }
 
        VStack {
           
            CustomText(text: self.question.question)
            ForEach(sortAnswers(correct_answer: self.question.correct_answer, incorrect_answers:self.question.incorrect_answers), id: \.self) { ans in
                ButtonView(text:ans, handle: {
                    
                    if self.index == self.play.NUM_QUESTIONS {
                        viewModel.state = .saveData(Score(name: play.name, score: play.score))
                        return
                    }
                    
                    if (ans == self.question.correct_answer) {
                        self.play.score += self.timeRemaining
                        
                    }
                    
                        self.timeRemaining = 30
                        self.index += 1
                        self.question = play.questions[index]
                       
                    
                })
              }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

let play = Play(questions: [trivialQuestionMock, trivialQuestionMock, trivialQuestionMock])

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Question(viewModel: QuizViewModel(), play: play)
        }
       
    }
}
