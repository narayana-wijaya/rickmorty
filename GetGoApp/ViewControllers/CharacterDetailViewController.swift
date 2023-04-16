//
//  CharacterDetailViewController.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 12/04/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    private var viewModel: CharacterViewModel?
    
    init(_ viewModel: CharacterViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
        tableView.register(LabelCell.self, forCellReuseIdentifier: "labelCell")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        populateData()
    }
    
    private func populateData() {
        guard let vm = viewModel else { return }
        title = vm.character.name
        imageView.sd_setImage(with: URL(string: vm.character.image), placeholderImage: nil, context: nil)
        nameLabel.text = vm.character.name
        statusLabel.text = "Status: \(vm.character.status)"
        statusImageView.image = UIImage(named: vm.character.status.lowercased())
        genderLabel.text = "Gender: \(vm.character.gender)"
        genderImageView.image = UIImage(named: vm.character.gender.lowercased())
        speciesLabel.text = "Species: \(vm.character.species)"
        createdLabel.text = vm.dateFormatted
        originLabel.text = vm.character.origin.name
        locationLabel.text = vm.character.location.name
        
        tableView.reloadData()
    }
}

extension CharacterDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.character.episode.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as? LabelCell else { fatalError("cell is not registered") }
        cell.selectionStyle = .none
        if let vm = viewModel {
            cell.set(vm.character.episode[indexPath.row])
        }
        return cell
    }
}
