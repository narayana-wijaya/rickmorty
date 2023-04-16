//
//  LocationListViewController+Extension.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import UIKit

extension LocationListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as? LocationTableViewCell else { fatalError("cell is not registered") }
        cell.setup(viewModel.itemAt(index: indexPath.row))
        return cell
    }
}

extension LocationListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = LocationDetailViewController(viewModel.itemAt(index: indexPath.row))
        self.present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !viewModel.results.isEmpty && indexPath.row == viewModel.results.count - 1 {
            viewModel.loadMore()
        }
    }
}

extension LocationListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.search(searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.search(nil)
    }
}

extension LocationListViewController: GetDataDelegate {
    func didFinishGetData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFinishGetData(with error: String) {
        self.showAlert("Error", messsage: error)
    }
}
