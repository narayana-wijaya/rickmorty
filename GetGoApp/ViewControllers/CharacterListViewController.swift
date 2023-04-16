//
//  CharacterListViewController.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 11/04/23.
//

import UIKit

class CharacterListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    lazy var viewModel: CharacterListViewModel = {
        let service = CharacterService()
        let vm = CharacterListViewModel(service: service)
        vm.delegate = self
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Character"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        setupCollectionView()
        setupSearchField()
        setupFilterButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CharacterCell")
    }
    
    private func setupSearchField() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupFilterButton() {
        let filterButton = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(filterButtonDidTapped))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc func filterButtonDidTapped() {
        let filterController = FilterViewController(filter: viewModel.filter)
        filterController.delegate = self
        filterController.modalPresentationStyle = .overFullScreen
        self.present(filterController, animated: false)
    }
}

