//
//  ViewController.swift
//  ReadyPlayWorkUIKit
//
//  Created by Hyuny on 2023/06/23.
//

import UIKit

class ViewController: UITableViewController {
    let viewModel: MainViewModel = MainViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") else {
            let makeCell = UITableViewCell(style: .default, reuseIdentifier: "MainCell")
            return makeCell
        }
        cell.textLabel?.text = "index - \(indexPath.row)"
        return cell
    }
}

