//
//  ListingCoordinator.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import UIKit

class ListingCoordinator : Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []

    weak var navigationController: UINavigationController?
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK - Functions
        
    func start() {
        let listingViewController = self.makeListingViewController()
        navigationController?.pushViewController(listingViewController, animated: true)
    }
    
    func makeListingViewController() -> ListingViewController {
        let useCase = NetworkCharacterUseCase()
        let viewModel = ListingViewModel(characterUseCase: useCase, coordinator: self)
        guard let viewController = ListingViewController.instantiate(with: viewModel) else {
            fatalError("ListingViewController not found")
        }
        return viewController
    }
    
    func gotoDetailScreen(character: Character) {
        let viewModel = CharacterDetailViewModel(character: character)
        guard let detailViewController = CharacterDetailViewController.instantiate(with: viewModel) else {
            fatalError("CharacterDetailViewController not found")
        }
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
