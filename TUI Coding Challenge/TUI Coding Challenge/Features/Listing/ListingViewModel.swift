//
//  ListingViewModel.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import Foundation

class ListingViewModel: ObservableObject {
    
    var coordinator : ListingCoordinator!
    
    init(coordinator: ListingCoordinator) {
        self.coordinator = coordinator
    }
}
