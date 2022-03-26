import SwiftUI

struct IRanking: Hashable {
    let name: String
    let score: String
}

struct Ranking: View {
    let ranking: [IRanking]
    
    init(ranking: [IRanking]) {
        self.ranking = ranking
    }
    
    var body: some View {
        VStack {
            CustomText(text: "🏁Ranking")
            ForEach(self.ranking, id: \.self) { item in
                HStack {
                    Text(item.name)
                    Text(item.score)
                }
              
            }
        }
      
    }
}

struct Ranking_Previews: PreviewProvider {
    
    static var previews: some View {
        Ranking(ranking: [
            IRanking(name: "Diana", score: "3443"),
            IRanking(name: "Pablo", score: "312443")
        ])
    }
}
