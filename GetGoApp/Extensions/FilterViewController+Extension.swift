//
//  FilterViewController+Extension.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 12/04/23.
//

import UIKit

extension FilterViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .status:
            return CharacterStatus.allCases.count
        case .species:
            return Species.allCases.count
        case .gender:
            return Gender.allCases.count
        case .none:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as? FilterCollectionViewCell else { fatalError("cell is not registered") }
        switch Section(rawValue: indexPath.section) {
        case .status:
            let status = CharacterStatus.allCases[indexPath.row]
            cell.setup(status.rawValue.capitalized, isSelected: filter.status == status)
        case .species:
            let species = Species.allCases[indexPath.row]
            cell.setup(species.rawValue.capitalized, isSelected: filter.species == species)
        case .gender:
            let gender = Gender.allCases[indexPath.row]
            cell.setup(gender.rawValue.capitalized, isSelected: filter.gender == gender)
        case .none:
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as? SectionHeaderView else { fatalError("header view is not registered") }
            headerView.setLabel(Section.allCases[indexPath.section].description)
            return headerView
        }
        return UICollectionReusableView()
    }
}

extension FilterViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch Section(rawValue: indexPath.section) {
        case .status:
            filter.status = CharacterStatus.allCases[indexPath.row]
        case .species:
            filter.species = Species.allCases[indexPath.row]
        case .gender:
            filter.gender = Gender.allCases[indexPath.row]
        case .none:
            return
        }
        collectionView.reloadSections(IndexSet(integer: indexPath.section))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var item: String = ""
        switch Section(rawValue: indexPath.section) {
        case .status:
            item = CharacterStatus.allCases[indexPath.row].rawValue
        case .species:
            item = Species.allCases[indexPath.row].rawValue
        case .gender:
            item = Gender.allCases[indexPath.row].rawValue
        case .none:
            return CGSize(width: 0, height: 0)
        }
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font: UIFont.SFProRounded(.semibold, size: 14)
        ])
        return CGSize(width: itemSize.width + 32, height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}

