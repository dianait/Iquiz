import SwiftUI

func save(ranking: [Score]) {
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(ranking)
        UserDefaults.standard.set(data, forKey: "ranking")
        }
    catch {
        print("Unable to Encode Score (\(error))")
    }
}

func get() -> [Score] {
    var ranking: [Score] = []
    if let data = UserDefaults.standard.data(forKey: "ranking") {
        do {
            let decoder = JSONDecoder()
            ranking = try decoder.decode([Score].self, from: data)
            return ranking
        } catch {
            print("Unable to Decode Score (\(error))")
        }
    }
    return ranking
}

struct FormView: View {
    var viewModel: QuizViewModel
    @State var score: Score
    @State private var username: String = ""
    @State var ranking: [Score] = []
    
    var body: some View {
        VStack {
            ImageView()
            CustomText(text: "What's your name ❓")
            TextField("Your name", text: self.$username)
                .padding()

            ButtonView(text: "CONTINUE", handle: {
                if username != "" {
                    self.score.name = username
                    self.ranking = viewModel.sortRanking(score: score)
                    save(ranking: self.ranking)
                    print("🏁🏁🏁🏁🏁🏁🏁")
                    print(get())
                    self.viewModel.state = .finish(self.ranking)
                }
               
            })
                Spacer()
        }

       
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(viewModel: QuizViewModel(), score: Score(name: "Player1", score: 0), ranking: rankingMock)
    }
}
