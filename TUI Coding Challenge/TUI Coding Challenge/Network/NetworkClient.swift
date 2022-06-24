//
//  NetworkClient.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import Foundation
import Combine

class NetworkClient: NetworkProvider {

    static let instance = NetworkClient()
    
    private init() {}
    
    private var cancellables = Set<AnyCancellable>()
    
    func performOperation<T: Decodable>(request: URLRequest, response: T.Type) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw httpError.nonSuccessStatusCode
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            print(decodingError.localizedDescription)
                            promise(.failure(decodingError))
                        case let apiError as httpError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(httpError.serverError))
                        }
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self!.cancellables)
        }
    }
}
