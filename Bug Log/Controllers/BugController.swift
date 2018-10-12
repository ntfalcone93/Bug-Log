//
//  BugController.swift
//  Bug Log
//
//  Created by Nathan Falcone on 10/11/18.
//  Copyright © 2018 Nathan Falcone Development. All rights reserved.
//

import Foundation
import CoreData

class BugController {


    var bugs: [Bug] {
        return fetchBugs()
    }

    // MARK: Create

    func create(with title: String,
                   log: String,
                   severity: Int,
                   causation: String,
                   steps: String) {

        Bug(title: title, log: log, severity: severity, causation: causation, steps: steps)
        saveContext()
    }

    // MARK: Retrieve

    func fetchBugs() -> [Bug] {
        let bugRequest = Bug.request()
        do {
            let bugs = try bugRequest.execute()
            return bugs
        } catch {
            print("\n\nERROR: CoreData - Could retrieve Bug entities.\nLog: \(error)")
        }
        return []
    }

    // MARK: Update

    func update(with title: String,
                   log: String,
                   severity: Int,
                   causation: String,
                   steps: String,
                   bugToUpdate: Bug) {

        bugToUpdate.title = title
        bugToUpdate.log = log
        bugToUpdate.severity = Int16(severity)
        bugToUpdate.causation = causation
        bugToUpdate.steps = steps

        saveContext()
    }

    // MARK: Delete

    func delete(_ bug: Bug) {
        CoreDataStack.managedObjectContext.delete(bug)
        saveContext()
    }

    // MARK: Save to persistent store

    private func saveContext() {
        do {
            try CoreDataStack.managedObjectContext.save()
        } catch {
            print("\n\nERROR: CoreData - Could not save managed object context.\nLog: \(error)\n\n")
        }
    }
}
