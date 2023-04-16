//
//  EpisodeDetailViewController.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    var viewModel: EpisodeViewModel?
    
    init(_ viewModel: EpisodeViewModel) {
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
        
        titleLabel.text = vm.item.name
        dateCreatedLabel.text = vm.dateFormatted
        airDateLabel.text = vm.airDate
        seasonLabel.text = "\(vm.season)"
        episodeLabel.text = "\(vm.episode)"
        
        tableView.reloadData()
    }
}

extension EpisodeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.item.characters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as? LabelCell else { fatalError("cell is not registered") }
        cell.selectionStyle = .none
        if let vm = viewModel {
            cell.set(vm.item.characters[indexPath.row])
        }
        return cell
    }
}
