//
//  Note+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by BridgeLabz on 23/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var color: String?
    @NSManaged public var createDate: String?
    @NSManaged public var id: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var isArchive: Bool
    @NSManaged public var isPin: Bool
    @NSManaged public var modifiedDate: String?
    @NSManaged public var remindDate: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var user: User?

}
