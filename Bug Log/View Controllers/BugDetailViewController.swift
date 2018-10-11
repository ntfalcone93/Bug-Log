//
//  BugDetailViewController.swift
//  Bug Log
//
//  Created by Nathan Falcone on 10/10/18.
//  Copyright © 2018 Nathan Falcone Development. All rights reserved.
//

import UIKit

class BugDetailViewController: UIViewController {

    // MARK: @IBOutlets

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!

    // MARK: Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: @IBActions

    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        // TODO: Save bug
    }
}
