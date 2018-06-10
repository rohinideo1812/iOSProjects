//
//  Note+CoreDataProperties.swift
//  FundooNotes
//
//  Created by BridgeLabz on 25/04/18.
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
    @NSManaged public var imageUrl: Data?
    @NSManaged public var isArchive: Bool
    @NSManaged public var isPin: Bool
    @NSManaged public var isDelete: Bool
    @NSManaged public var modifyDate: String?
    @NSManaged public var remindDate: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var seqId: Int32
    @NSManaged public var user: User?

}
