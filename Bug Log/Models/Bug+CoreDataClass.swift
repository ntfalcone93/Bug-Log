//
//  Bug+CoreDataClass.swift
//  Bug Log
//
//  Created by Nathan Falcone on 10/10/18.
//  Copyright © 2018 Nathan Falcone Development. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Bug)
public class Bug: NSManagedObject {

    convenience init(title: String, log: String, severity: Int, causation: String, steps: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)

        self.title = title
        self.log = log
        self.severity = Int16(severity)
        self.causation = causation
        self.timestamp = NSDate()
        self.steps = steps
    }
}
