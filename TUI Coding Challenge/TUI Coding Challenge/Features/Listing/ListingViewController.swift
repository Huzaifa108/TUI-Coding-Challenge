//
//  ListingViewController.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import UIKit

class ListingViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    
    internal static func instantiate() -> ListingViewController? {
        let storyboard = UIStoryboard(name: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ListingViewController") as? ListingViewController
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}


extension ListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension ListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterItem") as! CharacterItemTableViewCell
        cell.configure()
        return cell
    }
}
