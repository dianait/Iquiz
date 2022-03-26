import Foundation
import Combine
import UIKit
import SwiftUI

struct APIClient {
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    var session = URLSession.shared
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return session
            .dataTaskPublisher(for: request)
            .tryMap {
                result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .eraseToAnyPublisher()
    }
}

enum TrivialAPI {
    static let client = APIClient()
    static let trivialURL = URL(string: "https://opentdb.com/api.php?amount=30&category=11&type=multiple")!
    
    private static func makeRequest(url: URL) -> URLRequest {
        let request = URLRequest(url: url)
          return request
      }
    
    private static func fetch<R: Decodable>() -> AnyPublisher<R, Error> {
        return client.run(makeRequest(url: trivialURL))
            .map(\.value)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    static var trivialData: AnyPublisher<TrivialModel, Error> {
         fetch()
     }
    
}
