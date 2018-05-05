//
//  Login+CoreDataProperties.swift
//  LoginAndRegistration
//
//  Created by BridgeLabz on 21/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//
//

import Foundation
import CoreData


extension Login {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Login> {
        return NSFetchRequest<Login>(entityName: "Login")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var mobileNumber: Int32

}
