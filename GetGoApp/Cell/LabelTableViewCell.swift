//
//  LabelTableViewCell.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 12/04/23.
//

import UIKit

class LabelCell: UITableViewCell {
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.SFProRounded(.regular, size: 16)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(_ title: String) {
        label.text = title
    }
}
