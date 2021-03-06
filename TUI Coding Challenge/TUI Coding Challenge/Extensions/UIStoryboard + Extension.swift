//
//  UIStoryboard + Extension.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import UIKit

extension UIStoryboard {
    enum Name: String {
        case main = "Main"
    }
    
    convenience init(name: Name, bundle: Bundle? = nil) {
        self.init(name: name.rawValue, bundle: bundle)
    }
    
    func initialViewController<T: UIViewController>() -> T {
        guard let viewController = instantiateInitialViewController() as? T else {
            fatalError("Could not locate view controller in storyboard.")
        }
        
        return viewController
    }
}
