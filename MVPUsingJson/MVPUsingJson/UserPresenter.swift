//
//  UserPresenter.swift
//  MVPUsingJson
//
//  Created by BridgeLabz on 18/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
struct UserViewData{
    let name : String
    let age : String
}
protocol UserView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUsers(users: [UserViewData])
    func setEmptyUsers()
}
class UserPresenter {
    private let userService : UserService
    weak private var userView : UserView?
    
    init(userService:UserService){
        self.userService = userService
    }
    
    func attachView(view:UserView){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    func getUser(){
        self.userView?.startLoading()
        userService.getUser(callback: { [weak self] users in
            self?.userView?.finishLoading()
            if(users.count == 0){
                self?.userView?.setEmptyUsers()
            }else{
                let mappedUsers = users.map{
                    return UserViewData(name: "\($0.name)", age: "\($0.age)")
                }
                self?.userView?.setUsers(users: mappedUsers)
            }
        })
    }
}
