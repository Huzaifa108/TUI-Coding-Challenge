//
//  ListingViewController.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import UIKit
import Combine

class ListingViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    
    var viewModel : ListingViewModel!
    private var cancellables = Set<AnyCancellable>()
    

    internal static func instantiate(with viewModel: ListingViewModel) -> ListingViewController? {
        let storyboard = UIStoryboard(name: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ListingViewController") as? ListingViewController
        viewController?.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getCharacters()
        setupBinding()
    }
    
    func setupBinding() {
        viewModel.$filteredCharacter
           .receive(on: DispatchQueue.main)
           .sink { [weak self] items in
              self?.tableView.reloadData()
           }
           .store(in: &cancellables)
      }
    

}


extension ListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.openDetailScreen(for: self.viewModel.filteredCharacter[indexPath.row])
    }
}

extension ListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredCharacter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterItem") as! CharacterItemTableViewCell
        cell.configure(character: viewModel.filteredCharacter[indexPath.row])
        return cell
    }
}


//MARK: - Search Bar delegate
extension ListingViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.updateSearchString(newString: searchText)
    }
    
}
