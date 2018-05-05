//
//  User+CoreDataProperties.swift
//  CoreDataStorage
//
//  Created by BridgeLabz on 04/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}
