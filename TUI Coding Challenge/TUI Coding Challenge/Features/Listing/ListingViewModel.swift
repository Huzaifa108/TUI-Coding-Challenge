//
//  ListingViewModel.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import Foundation
import Combine

class ListingViewModel: ObservableObject {
    
    var coordinator : ListingCoordinator!
    let characterUseCase: CharacterUseCase
    @Published var characters: [Character]
    
    private var cancellables = Set<AnyCancellable>()

    
    init(characterUseCase: CharacterUseCase, coordinator: ListingCoordinator) {
        self.characterUseCase = characterUseCase
        self.coordinator = coordinator
        self.characters = []
    }
    
    func getCharacters() {
        self.characterUseCase.getCharacters()
            .replaceError(with: CharacterResponse.init(characters: []))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { response in
                self.characters = response.characters
            })
            .store(in: &cancellables)
    }
    
    
    func openDetailScreen(for character: Character) {
        self.coordinator.gotoDetailScreen(character: character)
    }
    
}
