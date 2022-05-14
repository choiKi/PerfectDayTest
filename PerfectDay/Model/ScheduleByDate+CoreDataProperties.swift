//
//  ScheduleByDate+CoreDataProperties.swift
//  
//
//  Created by 최기훈 on 2022/05/14.
//
//

import Foundation
import CoreData


extension ScheduleByDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScheduleByDate> {
        return NSFetchRequest<ScheduleByDate>(entityName: "ScheduleByDate")
    }

    @NSManaged public var date: String?
    @NSManaged public var title: String?
    @NSManaged public var time: Int?
    @NSManaged public var success: Bool

}
