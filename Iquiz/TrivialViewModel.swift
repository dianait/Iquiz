import Combine
import Foundation

enum TrivialListState {
    case initial
    case loaded([TrivialQuestion])
    case failed(Error)
}

class TrivialViewModel: ObservableObject {
 
    var cancellables: Set<AnyCancellable> = []
    @Published var state: TrivialListState = .initial
    
    func fetchQuestions() {
        TrivialAPI.trivialData
            .sink { result in
                if case .failure(let error) = result {
                    self.state = .failed(error)
                }
            } receiveValue: { trivialData in
                self.state = .loaded(trivialData)
                
            }
            .store(in: &cancellables)
    }
}
