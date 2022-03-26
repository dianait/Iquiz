import SwiftUI

struct Question: View {
    var trivialData: TrivialQuestion
    @State var question: IQuestion = questionMock
    
    init(question: [TrivialQuestion]){
        self.trivialData = trivialData
        self.question = trivialData.results[0]
    }
    
    var body: some View {
        VStack {
            Text(question.diffculty)
            Text(question.question)
            ForEach([question.correct_answer] + question.incorrect_answers, id: \.self) { a in
                Button(a){
                    if a == question.correct_answer {
                        let idx = self.trivialData.results.firstIndex(where: {$0 == self.question})
                        self.question = trivialData.results[idx! + 1]
                    }
                }
            }
        }
    }
    
struct Question_Previews: PreviewProvider {
    static var previews: some View {
        Question(trivialData: trivialModelMock)
        }
    }
}
