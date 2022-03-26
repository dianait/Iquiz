import SwiftUI

let rankingMock = [
    IRanking(name: "Diana", score: "3443"),
    IRanking(name: "Pablo", score: "312443")
]
struct ContentView: View {

    var body: some View {
            NavigationView {
            VStack {
                NavigationLink(destination:
                                Quiz()
                ) {
                        CustomText(text: "✨ COMENZAR")
                    }
                NavigationLink(destination: Ranking(ranking: rankingMock)) {
                        CustomText(text: "🏁 RANKING")
                    }
                }
            }.navigationTitle("🚀 IQuiz")
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
