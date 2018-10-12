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
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var severitySegmentControl: UISegmentedControl!
    @IBOutlet weak var causationTextView: UITextView!
    @IBOutlet weak var stepsTextView: UITextView!
    
    // MARK: Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: @IBActions

    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        createBug()
    }

    func createBug() {
        if let title = titleTextField.text,
            let logString = logTextView.text,
            let causationString = causationTextView.text,
            let stepsString = stepsTextView.text {

            let severity = severitySegmentControl.selectedSegmentIndex + 1

            BugController.create(withTitle: title, log: logString, severity: severity, causation: causationString, steps: stepsString)
        }
    }
}
