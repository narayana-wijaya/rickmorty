//
//  FilterCollectionViewCell.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 12/04/23.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private let selectedColor: UIColor = UIColor.systemBlue
    private let unselectedColor: UIColor = UIColor.lightGray
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        containerView.layer.borderWidth = 1
    }

    func setup(_ title: String, isSelected: Bool) {
        titleLabel.text = title
        titleLabel.sizeToFit()
        containerView.layer.borderColor = isSelected ? selectedColor.cgColor : unselectedColor.cgColor
        titleLabel.textColor = isSelected ? selectedColor : unselectedColor
    }
}
