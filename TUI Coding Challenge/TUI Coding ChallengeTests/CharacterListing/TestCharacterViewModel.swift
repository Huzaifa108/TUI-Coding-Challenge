//
//  TestCharacterViewModel.swift
//  TUI Coding ChallengeTests
//
//  Created by Huzaifa on 27.06.22.
//

import XCTest
import Combine

@testable import TUI_Coding_Challenge

class TestCharacterViewModel: XCTestCase {
    
    func testCharacterListViewModelSearchMethod() {
        var subscriptions = Set<AnyCancellable>()
        let expectation = self.expectation(description: "Get Searched Results")
        let networkUseCase = MockNetworkCharacterUseCase(networkProvider: TestUtils.mockNetworkClient(file: "response.json"))
        
        let viewModel = ListingViewModel(characterUseCase: networkUseCase, coordinator: ListingCoordinator(navigationController: UINavigationController()))
        viewModel.getCharacters()
        viewModel.updateSearchString(newString: "Rick")
        
        viewModel.$filteredCharacter.sink(receiveCompletion: { _ in }, receiveValue: { filteredCharacters in
            XCTAssertEqual(filteredCharacters.count, 4)
            XCTAssertNotNil(filteredCharacters)
            expectation.fulfill()
        }).store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 0.5)
        
    }
    
}
