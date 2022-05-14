//
//  Schedule+CoreDataProperties.swift
//  
//
//  Created by 최기훈 on 2022/05/14.
//
//

import Foundation
import CoreData


extension Schedule {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Schedule> {
        return NSFetchRequest<Schedule>(entityName: "Schedule")
    }

    @NSManaged public var selectDate: Date?
    @NSManaged public var scheduleByDate: [ScheduleByDate]?

}
