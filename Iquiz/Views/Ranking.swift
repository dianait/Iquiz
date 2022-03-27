import SwiftUI

struct Ranking: View {
    let ranking: [Score]
    
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
        Ranking(ranking: rankingMock)
    }
}
