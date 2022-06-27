//
//  MockNetworkClient.swift
//  TUI Coding ChallengeTests
//
//  Created by Huzaifa on 27.06.22.
//

import Foundation
import Combine
@testable import TUI_Coding_Challenge

class MockNetworkClient: NetworkProvider {
    
    var response: (Data?, Error?) = (nil, httpError.serverError)
    
    init(response: (Data?, Error?)) {
        self.response = response
    }
    
    func performOperation<T>(request: URLRequest, response: T.Type) -> Future<T, Error> where T : Decodable {
        return Future { [weak self] promise in
            if let error = self?.response.1 {
                promise(.failure(error))
            } else if let data = self?.response.0 {
                do {
                   let result = try JSONDecoder().decode(T.self, from: data)
                    promise(.success(result))
                } catch {
                    promise(.failure(error))
                }
            } else {
                promise(.failure(httpError.serverError))
            }
        }
    }
}
