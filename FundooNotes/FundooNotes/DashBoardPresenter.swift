//
//  DashBoardPresenter.swift
//  FundooNotes
//
//  Created by BridgeLabz on 22/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation

protocol DashBoardView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setNoteItems(notes: [NoteItem])
    func setEmptyNotes()
}
    class DashBoardPresenter {
        private let dashBoardService:DashBoardService
        weak private var dashBoardView : DashBoardView?
        init(dashBoardService:DashBoardService){
            self.dashBoardService = dashBoardService
        }
        
        func attachView(view:DashBoardView){
            dashBoardView = view
        }
        
        func detachView() {
            dashBoardView = nil
        }
        
        func getNotes(){
            self.dashBoardView?.startLoading()
            dashBoardService.getNotes{ [weak self] notes in
                self?.dashBoardView?.finishLoading()
                if(notes.count == 0){
                    self?.dashBoardView?.setEmptyNotes()
                }else{
                    self?.dashBoardView?.setNoteItems(notes: notes)
                    }
                }
            }
        
}


