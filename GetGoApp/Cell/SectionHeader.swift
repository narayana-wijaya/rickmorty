//
//  SectionHeader.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 12/04/23.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.SFProRounded(.semibold, size: 16)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabel(_ title: String) {
        label.text = title
    }
}
