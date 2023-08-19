import SwiftUI

struct Question: View {
    @State var play: Play
    @State var index: Int = 0
    var COUNTER_TIME: Int = 30
    var viewModel: QuizViewModel
    var TIME_TO_WAIT: Double = 2.0
    @State var timeRemaining: Int = 30
    @State var showCorrectAnswer: Bool = false
    @State var question: TrivialQuestion = trivialQuestionMock
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private func nextQuestion() -> Void {
        self.showCorrectAnswer = true
        DispatchQueue.main.asyncAfter(deadline: .now() + TIME_TO_WAIT) {
            self.timeRemaining = COUNTER_TIME
            self.index += 1
            self.showCorrectAnswer = false
            self.question = play.questions[index]
        }
    }
    
    private func finish() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TIME_TO_WAIT) {
            let currentScore = Score(name: play.name, score: play.score)
            viewModel.state = .saveData(currentScore)
         }
    }
    
    var body: some View {
        VStack {
            HStack{
                ScoreView(score: play.score).frame(maxWidth: .infinity, alignment: .leading)
                CustomText(text: "⏱ TIME: \(timeRemaining)")
                    .onReceive(self.timer) { _ in
                            if self.timeRemaining > 0 {
                                self.timeRemaining -= 1
                        }
                            else {
                                self.nextQuestion()
                            }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }.onAppear {
            self.question = play.questions[index]
        }

        VStack {
            CustomText(text: self.question.question)
            
                ForEach(self.question.answers, id: \.self) { ans in
                    ButtonView(answer: ans,
                               text:ans.text, handle: {
                        self.showCorrectAnswer = true
                        if self.index == self.play.NUM_QUESTIONS {
                            self.finish()
                            return
                        }
                        if (ans.isCorrect) {
                            self.play.score += self.timeRemaining
                        }
                        self.nextQuestion()
                    }, showCorrectAnswer: $showCorrectAnswer)
                  }
          
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

