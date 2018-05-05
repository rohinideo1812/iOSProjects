//
//  Notes+CoreDataProperties.swift
//  FundooNotes
//
//  Created by BridgeLabz on 23/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var imageUrl: String?
    @NSManaged public var modifyDate: String?
    @NSManaged public var createDate: String?
    @NSManaged public var remindDate: String?
    @NSManaged public var isPin: Bool
    @NSManaged public var isArchive: Bool
    @NSManaged public var color: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var id: String?
    @NSManaged public var user: User?

}
