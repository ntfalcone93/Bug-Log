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

    // MARK: Properties

    var bug: Bug?
    
    // MARK: Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        if let bug = bug {
            titleTextField.text = bug.title
            logTextView.text = bug.log
            severitySegmentControl.selectedSegmentIndex = Int(bug.severity) - 1
            causationTextView.text = bug.causation
            stepsTextView.text = bug.steps

            title = "Update Bug"
        }
    }

    // MARK: @IBActions

    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        saveBug()
    }

    func saveBug() {
        if let title = titleTextField.text,
            let logString = logTextView.text,
            let causationString = causationTextView.text,
            let stepsString = stepsTextView.text {

            let severity = severitySegmentControl.selectedSegmentIndex + 1

            if let bug = bug {
                BugController.update(withTitle: title,
                                     log: logString,
                                     severity: severity,
                                     causation: causationString,
                                     steps: stepsString,
                                     bugToUpdate: bug)
            } else {
                BugController.create(withTitle: title,
                                     log: logString,
                                     severity: severity,
                                     causation: causationString,
                                     steps: stepsString)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
