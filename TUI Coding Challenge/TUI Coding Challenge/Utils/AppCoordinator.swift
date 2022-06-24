//
//  AppCoordinator.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    weak var navigationController: UINavigationController?
    
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let navigationController = navigationController else { return }
        let listingCoordinator = ListingCoordinator(navigationController: navigationController)
        listingCoordinator.parentCoordinator = self
        listingCoordinator.start()
        children.append(listingCoordinator)
    }
    
}
