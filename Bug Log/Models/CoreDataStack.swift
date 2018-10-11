//
//  CoreDataStack.swift
//  Bug Log
//
//  Created by Nathan Falcone on 10/10/18.
//  Copyright © 2018 Nathan Falcone Development. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {

    static let container: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "BugListCoreData")
        container.loadPersistentStores() { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    static var context: NSManagedObjectContext { return container.viewContext }
}
