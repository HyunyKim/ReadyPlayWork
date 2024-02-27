//
//  MainViewController.swift
//  ReadyPlayWorkUIKit
//
//  Created by JeongHyun Kim on 2/2/24.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var tableViiew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViiew.register(UINib(nibName: MainListCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: MainListCell.identifier)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainListCell.identifier) as? MainListCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = "\(indexPath.section) - \(indexPath.row)"
        return cell
    }
}
