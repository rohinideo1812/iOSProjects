//
//  User+CoreDataProperties.swift
//  FundooNotes
//
//  Created by BridgeLabz on 23/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var mobile: String?
    @NSManaged public var password: String?
    @NSManaged public var notes: NSSet?

}

// MARK: Generated accessors for notes
extension User {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Notes)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Notes)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}
