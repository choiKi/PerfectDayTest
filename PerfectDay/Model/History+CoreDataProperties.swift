//
//  History+CoreDataProperties.swift
//  
//
//  Created by 최기훈 on 2022/05/14.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var date: Date?
    @NSManaged public var success: Int32
    @NSManaged public var failed: Int32

}
