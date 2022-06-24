//
//  CharacterModel.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import Foundation

struct CharacterResponse: Codable {
    let characters: [Character]
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}

struct Character: Codable {
    
    let id: Int
    let name, species, type, gender, image, url, created: String
    let status: Status
    let episode: [String]

}

enum Status: String, Codable {
    case Alive
    case Dead
    case unknown
}
