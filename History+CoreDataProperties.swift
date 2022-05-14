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

    @NSManaged public var pastDate: String?
    @NSManaged public var failedCnt: Int32
    @NSManaged public var successCnt: Int32

}
