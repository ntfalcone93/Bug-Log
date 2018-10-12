//
//  BugListViewController.swift
//  Bug Log
//
//  Created by Nathan Falcone on 10/10/18.
//  Copyright © 2018 Nathan Falcone Development. All rights reserved.
//

import UIKit

class BugListViewController: UITableViewController {

    // MARK: Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBugDetailFromCellSelection",
            let bugDetailVC = segue.destination as? BugDetailViewController,
            let selectedIndex = tableView.indexPathForSelectedRow?.row {

            bugDetailVC.bug = BugController.bugs[selectedIndex]
        }
    }
}

// MARK: - Table view methods

extension BugListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BugController.bugs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bugCell", for: indexPath)

        let bug = BugController.bugs[indexPath.row]
        cell.textLabel?.text = bug.title
        cell.detailTextLabel?.text = bug.log

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let bug = BugController.bugs[indexPath.row]
            BugController.delete(bug)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
