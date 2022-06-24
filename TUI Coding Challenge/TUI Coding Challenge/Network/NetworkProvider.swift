//
//  NetworkProvider.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import Foundation
import Combine

enum httpError : Error {
    case jsonDecoding
    case noData
    case nonSuccessStatusCode
    case serverError
    case emptyCollection
    case emptyObject
    case noInternet
}

protocol NetworkProvider {
    func performOperation<T: Decodable>(request: URLRequest, response: T.Type) -> Future<T, Error>
}
