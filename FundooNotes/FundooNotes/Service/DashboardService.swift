//
//  DashboardService.swift
//  FundooNotes
//
//  Created by BridgeLabz on 22/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit

struct NoteItem {
    let title : String?
    let image : UIImage?
    let date : String?
    let subtitle : String?
}
class DashBoardService {
    
    func getNotes(callBack:([NoteItem]) -> Void){

        let notes = NoteDataBase.sharedInstance.fetchNoteData()
        callBack(notes)
    }
}
