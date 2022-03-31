import SwiftUI

struct ButtonView: View {
    var answer: Answer
    var text: String
    var handle: ()-> Void
    @Binding var showCorrectAnswer: Bool
 
    var body: some View {
        Button(text){
               handle()
        }.padding(24)
            .font(.system(.title2, design: .monospaced))
            .frame(width: 400)
            .border(Color.blue)
            .background(showCorrectAnswer ? answer.isCorrect ? Color.green : Color.red : Color.clear)
    }
}


