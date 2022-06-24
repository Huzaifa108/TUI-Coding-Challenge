//
//  ViewController + Extension.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alert(withTitle title: String = "Error",
               desc message: String,
               andActions actions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .default, handler: nil)]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
    
}
