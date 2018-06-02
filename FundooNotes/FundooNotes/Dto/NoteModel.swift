//
//  NoteModel.swift
//  FundooNotes
//
//  Created by BridgeLabz on 06/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit


struct NoteItem {
    let title : String?
    let subtitle : String?
    let image : UIImage?
    let isPin : Bool?
    let isArchive : Bool?
    let remindDate : String?
    let date : String?
    let id : String?
    
}


struct NoteToDisplay {
    let title : String?
    let subtitle : String?
    let image : UIImage?
    let date : String?
}
