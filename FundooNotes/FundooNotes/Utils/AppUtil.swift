//
//  AppUtil.swift
//  FundooNotes
//
//  Created by BridgeLabz on 26/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
class ApUtil {
    
    static var shareInstance = ApUtil()
    
    private init(){}
    let userdefault = UserDefaults.standard
    func setDefaultValue(email : String?) {
       userdefault.set(email, forKey: "email")
    }
    
    func getDefaultValue()->String?{
    return userdefault.string(forKey: "email")
    }
}
