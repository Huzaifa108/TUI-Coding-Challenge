//
//  CharacterItemTableViewCell.swift
//  TUI Coding Challenge
//
//  Created by Huzaifa on 24.06.22.
//

import UIKit
import SDWebImage

class CharacterItemTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var CharacterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configure(character: Character) {
        self.CharacterNameLabel.text = character.name
        self.characterImageView.sd_setImage(with: URL(string: character.image),
                              placeholderImage: UIImage(named: "placeholder"))
    }

    
}
