//
//  LocationTableViewCell.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
    }
    
    func setup(_ viewModel: LocationViewModel) {
        nameLabel.text = viewModel.location.name
        typeLabel.text = viewModel.location.type
        dimensionLabel.text = viewModel.location.dimension
    }
}
