//
//  BugExtension.swift
//  Bug Log
//
//  Created by Nathan Falcone on 10/11/18.
//  Copyright © 2018 Nathan Falcone Development. All rights reserved.
//

import Foundation
import CoreData

extension Bug {

    @discardableResult convenience init(title: String,
                     log: String,
                     severity: Int,
                     causation: String,
                     steps: String) {

        self.init(context: CoreDataStack.managedObjectContext)
        
        self.title = title
        self.log = log
        self.severity = Int16(severity)
        self.causation = causation
        self.steps = steps
        self.timestamp = Date()
    }
}
