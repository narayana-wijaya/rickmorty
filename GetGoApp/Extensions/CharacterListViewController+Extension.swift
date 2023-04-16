//
//  CharacterListViewController+Extension.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 11/04/23.
//

import UIKit

extension CharacterListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as? CharacterCollectionViewCell else { fatalError("cell not found") }
        cell.setup(viewModel.itemAt(index: indexPath.row))
        return cell
    }
}

extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = CharacterDetailViewController(viewModel.itemAt(index: indexPath.row))
        self.show(detailController, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !viewModel.results.isEmpty && indexPath.row == viewModel.results.count - 1 {
            viewModel.loadMore()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/2
        return CGSize(width: width, height: width*240/180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension CharacterListViewController: GetDataDelegate {
    func didFinishGetData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func didFinishGetData(with error: String) {
        self.showAlert("Error", messsage: error)
    }
}

extension CharacterListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.search(searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.search(nil)
    }
}

extension CharacterListViewController: FilterViewDelegate {
    func didFinishSelect(_ filter: Filter) {
        viewModel.setFilter(filter)
    }
}
