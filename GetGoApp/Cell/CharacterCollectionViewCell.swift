//
//  CharacterCollectionViewCell.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 11/04/23.
//

import UIKit
import SDWebImage

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        bgView.backgroundColor = .systemGroupedBackground
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    func setup(_ viewModel: CharacterViewModel) {
        nameLabel.text = viewModel.character.name
        speciesLabel.text = viewModel.character.species
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        imageView.sd_setImage(with: URL(string: viewModel.character.image), placeholderImage: nil, context: nil)
    }
}
