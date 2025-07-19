import Foundation

struct Score: Codable, Hashable {
    var name: String
    let score: Int
}

let rankingMock = [
    Score(name: "PLAYER1", score: 123),
    Score(name: "PLAYER2", score: 45),
    Score(name: "PLAYER3", score: 34)
]

class StorageController {
    var ranking: [Score] = []
    
    init(){
        if CommandLine.arguments.contains("--mockRanking") {
                 self.ranking = rankingMock
             } else {
                 self.ranking = get()
             }
    }
    
    func save(ranking: [Score]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(ranking)
            UserDefaults.standard.set(data, forKey: "ranking")
            }
        catch {
            print("Unable to Encode Score Array (\(error))")
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
                print("Unable to Decode Score Array (\(error))")
            }
        }
        return ranking
    }
}
