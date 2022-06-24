//
//  NetworkCharacterUseCase.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import Foundation
import Combine

final class NetworkCharacterUseCase {
    
    // MARK:- Private Properties
    private let urlString = "https://rickandmortyapi.com/api/character"
    var networkClient: NetworkProvider = NetworkClient.instance
}

extension NetworkCharacterUseCase: CharacterUseCase {
    
    func getCharacters() -> Future<CharacterResponse, Error> {
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        return networkClient.performOperation(request: urlRequest, response: CharacterResponse.self)
    }
}
