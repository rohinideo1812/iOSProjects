//
//  UserPresenter.swift
//  FundooNotes
//
//  Created by BridgeLabz on 07/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation

protocol UserView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUsers(users: UserModel)
    func setEmptyUsers()
    
}

class Presenter {
    private let userService:Service
    weak private var userView : UserView?
    var user : UserModel?

    
    init(userService:Service){
        self.userService = userService
    }
    
    func attachView(view:UserView){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func getUsers(email : String?,callback : (_ isAvailable : Bool,_ object : UserModel?)-> Void){
            Service.sharedInstance.getUsers(email: email, callback: {isavailable,object in
                callback(isavailable,object)
    
            })
}
}
