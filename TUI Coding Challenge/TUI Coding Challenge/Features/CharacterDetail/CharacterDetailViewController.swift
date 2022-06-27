//
//  CharacterDetailViewController.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import UIKit
import Combine
import SDWebImage

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak private var characterImageView: UIImageView!
    @IBOutlet weak private var characterNameLabel: UILabel!
    @IBOutlet weak private var characterStatusLabel: UILabel!
    @IBOutlet weak private var characterSpeciesLabel: UILabel!
    @IBOutlet weak private var numberOfEpisodeLabel: UILabel!
    
    var viewModel : CharacterDetailViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    internal static func instantiate(with viewModel: CharacterDetailViewModel) -> CharacterDetailViewController? {
        let storyboard = UIStoryboard(name: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController
        viewController?.viewModel = viewModel
        return viewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Character Detail"
        setupBinding()
    }
    
    
    func setupBinding() {
        viewModel.$character
            .receive(on: DispatchQueue.main)
            .sink { [weak self] character in
                if let character = character {
                    self?.characterImageView.sd_setImage(with: URL(string: character.image),
                                                         placeholderImage: UIImage(named: "placeholder"))
                    self?.characterNameLabel.text = character.name
                    self?.characterStatusLabel.text = character.status.rawValue
                    self?.characterSpeciesLabel.text = character.species
                    self?.numberOfEpisodeLabel.text = String(describing: character.episode.count) + " episodes"
                }
            }
            .store(in: &cancellables)
    }

}
