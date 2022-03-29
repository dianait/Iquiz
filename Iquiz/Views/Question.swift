import SwiftUI

struct Question: View {
    var viewModel: QuizViewModel
    @State var play: Play
    @State var question: TrivialQuestion = trivialQuestionMock
    @State var index: Int = 0
    @State var timeRemaining: Int = 5
    @State var showCorrectAnswer : Bool = false
    
    private func nextQuestion() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.showCorrectAnswer = false
            self.timeRemaining = 30
            self.index += 1
            self.question = play.questions[index]
         }
    }
    
    private func finish() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            viewModel.state = .saveData(Score(name: play.name, score: play.score))
         }
    }
    
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
            if self.showCorrectAnswer {
                CustomText(text: "The correct answer was: \(question.correct_answer)")
            }
            else {
                ForEach(self.question.answers.shuffled(), id: \.self) { ans in
                    ButtonView(text:ans, handle: {
                        if self.index == self.play.NUM_QUESTIONS {
                            self.finish()
                            return
                        }
                        if (ans == self.question.correct_answer) {
                            self.play.score += self.timeRemaining
                        }
                        else {
                            self.showCorrectAnswer = true
                        }
                        self.nextQuestion()
                    })
                  }
                
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
