//
//  MockNetworkCharacterUseCase.swift
//  TUI Coding ChallengeTests
//
//  Created by Huzaifa on 27.06.22.
//

import Foundation
import Combine
@testable import TUI_Coding_Challenge
final class MockNetworkCharacterUseCase {
    
    var networkClient: NetworkProvider
    
    private let urlString = "https://rickandmortyapi.com/api/character"
    
    init(networkProvider: NetworkProvider) {
        networkClient = networkProvider
    }
}

extension MockNetworkCharacterUseCase: CharacterUseCase {
    
    func getCharacters() -> Future<CharacterResponse, Error> {
        var urlRequest = URLRequest(url: URL(string: urlString)!) // 
        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        return networkClient.performOperation(request: urlRequest, response: CharacterResponse.self)
    }
}
