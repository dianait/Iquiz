import SwiftUI

struct Question: View {
    var play: Play
    @State var question: TrivialQuestion = trivialQuestionMock
    @State var index: Int = 0
    
    var body: some View {
        VStack {
            Counter()
                .frame(maxWidth: .infinity, alignment: .trailing)
        }.onAppear{
            self.question = play.questions[index]
        }
        
        VStack {
            CustomText(text: self.question.question)
            ForEach(self.question.incorrect_answers + [self.question.correct_answer], id: \.self) { ans in
                Button(ans){
                    if ans == self.question.correct_answer {
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
            Question(play: play)
        }
       
    }
}
