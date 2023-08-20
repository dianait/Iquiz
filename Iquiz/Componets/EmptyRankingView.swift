import SwiftUI

struct EmptyRankingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.3.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray.opacity(0.5))

            Text("No scores yet!")
                .font(.title)
                .fontWeight(.bold)

            Text("Be the first to set a record and climb to the top of the leaderboard!")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .opacity(0.7)
        }
    }
}

struct EmptyRankingView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyRankingView()
        .previewDisplayName("Ranking fill")
    }
}
