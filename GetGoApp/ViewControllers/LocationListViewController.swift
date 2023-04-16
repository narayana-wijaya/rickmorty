//
//  LocationListViewController.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import UIKit

class LocationListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    lazy var viewModel: LocationListViewModel = {
        let service: LocationServiceProtocol = LocationService()
        let vm = LocationListViewModel(service)
        vm.delegate = self
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Location"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "locationCell")
        setupSearchField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    private func setupSearchField() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}
