//
//  CharacterUseCase.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import Foundation
import Combine

protocol CharacterUseCase {
    func getCharacters() -> Future<CharacterResponse,Error>
}
