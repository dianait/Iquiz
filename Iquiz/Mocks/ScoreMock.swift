import Foundation

func generateRandomPlayers(count: Int) -> [Score] {
    var players: [Score] = []

    for _ in 0..<count {
        let name = "\(randomLetter()).\(randomLetter()).\(randomLetter())"
        let score = Int.random(in: 0...1000)

        players.append(Score(name: name, score: score))
    }

    return players.sorted(by: { $0.score > $1.score })
}

func randomLetter() -> String {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return String(letters.randomElement()!)
}

