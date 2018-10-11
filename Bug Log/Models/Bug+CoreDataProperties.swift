//
//  Bug+CoreDataProperties.swift
//  Bug Log
//
//  Created by Nathan Falcone on 10/10/18.
//  Copyright © 2018 Nathan Falcone Development. All rights reserved.
//
//

import Foundation
import CoreData


extension Bug {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bug> {
        return NSFetchRequest<Bug>(entityName: "Bug")
    }

    @NSManaged public var title: String?
    @NSManaged public var log: String?
    @NSManaged public var severity: Int16
    @NSManaged public var causation: String?
    @NSManaged public var timestamp: NSDate?
    @NSManaged public var steps: String?

}
