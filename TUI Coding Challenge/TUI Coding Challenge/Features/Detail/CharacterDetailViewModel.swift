//
//  CharacterDetailViewModel.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import Foundation

class CharacterDetailViewModel {
    
    @Published var character: Character!
    
    init(character: Character) {
        self.character = character
    }
    
}
