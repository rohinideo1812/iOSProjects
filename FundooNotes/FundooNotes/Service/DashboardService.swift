//
//  DashboardService.swift
//  FundooNotes
//
//  Created by BridgeLabz on 22/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit


class DashBoardService {
    
    func getNotes(callBack:([NoteItem]) -> Void){
        let notes = NoteDataBase.sharedInstance.fetchNoteData()
        print("Notes-------------------------------",notes)
        callBack(notes)
    }
}
