//
//  EpisodeTableViewCell.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
    }
    
    func setup(_ viewModel: EpisodeViewModel) {
        titleLabel.text = viewModel.item.name
        seasonLabel.text = "Season: \(viewModel.season)"
        episodeLabel.text = "Episode: \(viewModel.episode)"
        airDateLabel.text = viewModel.airDate
    }
}
