//
//  FilterViewController.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 12/04/23.
//

import UIKit

protocol FilterViewDelegate: AnyObject {
    func didFinishSelect(_ filter: Filter)
}

class FilterViewController: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    var filter: Filter!
    var containerHeight: CGFloat = 600
    
    weak var delegate: FilterViewDelegate?
    
    init(filter: Filter) {
        super.init(nibName: nil, bundle: nil)
        self.filter = filter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentFilterView(show: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomConstraint.constant = -containerHeight
        bgView.backgroundColor = .black.withAlphaComponent(0)
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
        setupCollectionView()
        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeightConstraint.constant = height
        self.view.setNeedsLayout()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionHeader")
        collectionView.register(UINib(nibName: "FilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "filterCell")
    }
    
    @IBAction func applyButtonDidTapped(_ sender: UIButton) {
        self.delegate?.didFinishSelect(filter)
        self.presentFilterView(show: false)
    }
    
    private func presentFilterView(show: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.bottomConstraint.constant = show ? 0 : -self.containerHeight
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.4) {
            self.bgView.backgroundColor = .black.withAlphaComponent(show ? 0.6 : 0)
        } completion: { _ in
            if !show {
                self.dismiss(animated: false)
            }
        }
    }
    
    enum Section: Int, CaseIterable, CustomStringConvertible {
        case status, species, gender
        
        var description: String {
            switch self {
            case .status: return "Status"
            case .species: return "Species"
            case .gender: return "Gender"
            }
        }
    }
}




