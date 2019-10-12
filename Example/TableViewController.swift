//
//  TableViewController.swift
//  ModernAVPlayer_Example
//
//  Created by ankierman on 12/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {

    private let dataSource: [DemoScreens] = [.monkeyTests]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "screenCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].description
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navVC = navigationController else { assertionFailure(); return }

        let id = dataSource[indexPath.row].id
        let sb = UIStoryboard(name: id, bundle: Bundle.main)
        let vc = sb.instantiateViewController(withIdentifier: id)
        navVC.pushViewController(vc, animated: true)
    }
}
