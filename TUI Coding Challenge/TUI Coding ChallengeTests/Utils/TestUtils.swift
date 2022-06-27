//
//  TestUtils.swift
//  TUI Coding ChallengeTests
//
//  Created by Huzaifa on 27.06.22.
//

import Foundation

class TestUtils {
    static func loadData(file: String) -> Data? {
        guard let url = Bundle(for: Self.self).url(forResource: file, withExtension: nil), let data = try? Data(contentsOf: url) else { return nil }
        return data
    }
    
    static func mockNetworkClient(file: String) -> MockNetworkClient {
        let data = loadData(file: file)
        return MockNetworkClient(response: (data, nil))
    }
    
    static func MockModel<T: Decodable >(_ file: String, of type: T.Type) throws -> T {
        let data = loadData(file: file)
        return try JSONDecoder().decode(T.self, from: data!)
    }
    
}
