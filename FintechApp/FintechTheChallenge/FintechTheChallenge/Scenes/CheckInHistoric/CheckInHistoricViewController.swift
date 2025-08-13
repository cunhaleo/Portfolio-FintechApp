//
//  CheckInHistoricViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 06/01/22.
//

import UIKit

final class CheckInHistoricViewController: BaseViewController {
    // MARK: Properties
    var coordinator: HomeCoordinator?
    let viewModel = CheckInHistoricViewModel()
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        viewModel.getFakeService()
    }
    
    private func setupUI() {
        title = "Histórico de check-in"
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CheckInTableViewCell.identifier,
                                 bundle: nil),
                           forCellReuseIdentifier: CheckInTableViewCell.identifier)
        tableView.reloadData()
    }
}

extension CheckInHistoricViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.actualMonth.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CheckInTableViewCell.identifier, for: indexPath) as? CheckInTableViewCell {
            cell.setup(with: viewModel.monthWithDayStyles[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
