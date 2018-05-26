//
//  Presenter.swift
//  MVPCoreData
//
//  Created by BridgeLabz on 07/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
protocol UserView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUsers(users: UserData)//
    func setEmptyUsers()
}


class Presenter{
     var service:Service?
    weak private var userView : UserView?
    
//    init(userService:Service){
//        self.service = userService
//    }
    
    func attachView(view:UserView){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func getUsers(firstName : String?,callback:(_ isAvailable : Bool?,_ object : UserData?)->Void) {
        service = Service()
        self.userView?.startLoading()
        service?.getUsers(name: firstName, callBack: {isAvailable,object in
            callback(isAvailable,object)
       self.userView?.finishLoading()
            
           
        }
        
            )
//        userService.getUsers{ [weak self] users in
//            self?.userView?.finishLoading()
//            if(users.count == 0){
//                self?.userView?.setEmptyUsers()
//            }else{
//                let mappedUsers = users.map{
//                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
//                }
//                self?.userView?.setUsers(users: mappedUsers)
//            }
//        }
//    }
    }
    func insertUsers(object: UserData?) {
        service?.insertUserData(user: object)
    }
}
