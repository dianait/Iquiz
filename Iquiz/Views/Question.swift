import SwiftUI

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
            ForEach(self.question.incorrect_answers + [self.question.correct_answer], id: \.self) { ans in
                Button(ans){
                    if ans == self.question.correct_answer {
                        self.play.score += self.timeRemaining
                        if self.index == self.play.NUM_QUESTIONS {
                            viewModel.state = .finish([Score(name: self.play.name, score: String(self.play.score))])
                            return
                        }
                        
                        self.timeRemaining = 30
                        self.index += 1
                        self.question = play.questions[index]
                       
                        
                        
                    }
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
