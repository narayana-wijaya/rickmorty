//
//  LocationDetailViewController.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import UIKit

class LocationDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    
    var viewModel: LocationViewModel?
    
    init(_ viewModel: LocationViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = headerView
        tableView.dataSource = self
        tableView.register(LabelCell.self, forCellReuseIdentifier: "labelCell")
        populateData()
    }
    
    private func populateData() {
        guard let vm = viewModel else { return }
        
        nameLabel.text = vm.location.name
        dateCreatedLabel.text = vm.dateFormatted
        typeLabel.text = "Type: \(vm.location.type)"
        dimensionLabel.text = vm.location.dimension
        
        tableView.reloadData()
    }
}

extension LocationDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.location.residents.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as? LabelCell else { fatalError("cell is not registered") }
        cell.selectionStyle = .none
        if let vm = viewModel {
            cell.set(vm.location.residents[indexPath.row])
        }
        return cell
    }
}
