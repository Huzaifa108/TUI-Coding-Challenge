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
    @Published var filteredCharacter: [Character]
    
    private var cancellables = Set<AnyCancellable>()

    private var searchString: String = "" {
        didSet {
            if searchString.isEmpty {
                self.filteredCharacter = self.characters
            }
            else {
                self.filteredCharacter = self.characters.filter({ character in
                    character.name.contains(searchString)
                })
            }
        }
    }
    
    var showAlert : (String)->Void = {
        alert in
    }
    
    init(characterUseCase: CharacterUseCase, coordinator: ListingCoordinator) {
        self.characterUseCase = characterUseCase
        self.coordinator = coordinator
        self.characters = []
        self.filteredCharacter = []
    }
    
    func getCharacters() {
        if Reachability.isConnectedToNetwork() {
            self.characterUseCase.getCharacters()
                .replaceError(with: CharacterResponse.init(characters: []))
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let err):
                        print("Error is \(err.localizedDescription)")
                        self.showAlert(err.localizedDescription)
                    case .finished:
                        print("Finished")
                    }
                }, receiveValue: { response in
                    self.characters = response.characters
                    self.filteredCharacter = self.characters
                })
                .store(in: &cancellables)
        }
        else {
            print("No Internet connection")
            self.showAlert("No Internet Connection")
        }
    }
    
    
    func openDetailScreen(for character: Character) {
        self.coordinator.gotoDetailScreen(character: character)
    }
    
    
    func updateSearchString(newString: String) {
        self.searchString = newString
    }
}
