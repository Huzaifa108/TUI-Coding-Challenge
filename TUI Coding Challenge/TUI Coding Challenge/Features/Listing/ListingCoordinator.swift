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
        guard let viewController = ListingViewController.instantiate() else {
            fatalError("ListingViewController not found")
        }
        return viewController
    }
    
}
