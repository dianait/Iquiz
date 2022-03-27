import SwiftUI

func getDocumentsDirectory() -> URL {
    // find all possible documents directories for this user
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    // just send back the first one, which ought to be the only one
    return paths[0]
}

func saveData(ranking: [Score]) {
    let str = "\(ranking[0].name) - \(ranking[0].score)"
           let url = getDocumentsDirectory().appendingPathComponent("message.txt")
           do {
               try str.write(to: url, atomically: true, encoding: .utf8)
           } catch {
               print(error.localizedDescription)
           }
        
}

func getData() -> Score {
    let url = getDocumentsDirectory().appendingPathComponent("message.txt")
    do {
        let input = try String(contentsOf: url)
        print(input)
        let newScore = parseRanking(data: input)
        return newScore
    } catch {
        print(error.localizedDescription)
    }
    return Score(name: "Player 1", score: String(0))
}

func parseRanking(data: String) -> Score {
    let scoreArray = data.components(separatedBy: " - ")
    return Score(name: scoreArray[0], score: scoreArray[1])
    
}

struct Ranking: View {
    var viewModel: QuizViewModel
    @State var ranking: [Score]
    
    var body: some View {
        VStack {
            ImageView().onAppear{
                self.ranking = getRanking()
            }
            CustomText(text: "🏁Ranking")
            ForEach(self.ranking, id: \.self) { item in
                HStack {
                    Text(item.name)
                    Text(item.score)
                }
              
            }
            ButtonView(text: "TRY AGAIN", handle: {
                viewModel.state = .initial
            })
            Spacer()
        }
      
    }
}

struct Ranking_Previews: PreviewProvider {
    static var previews: some View {
        Ranking(viewModel: QuizViewModel(), ranking: rankingMock)
    }
}



