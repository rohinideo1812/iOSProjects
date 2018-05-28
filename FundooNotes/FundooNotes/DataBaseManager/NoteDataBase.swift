//
//  NoteDataBase.swift
//  FundooNotes
//
//  Created by BridgeLabz on 28/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class NoteDataBase {
    static var sharedInstance = NoteDataBase()
    public init(){}
    
    
    var notedata : NoteModel?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    //MARK: Insert Note Data
    func insertNoteData(object : NoteModel?) {
        var id = 1
        let note = Note(context: appDelegate.persistentContainer.viewContext)
        if let title = object?.title {
            note.title = title
        }
        if let subtitle = object?.note {
            note.subtitle = subtitle
        }
        if let image = object?.image{
            let imageToBeStored = UIImagePNGRepresentation(image) as! NSData
            let dataString = String(data: imageToBeStored as Data, encoding: String.Encoding.utf8)
            note.imageUrl = dataString
        }
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let result = formatter.string(from: date)
        note.color = ""
        note.createDate = result
        note.modifyDate = result
        note.id = String(id)
        note.seqId = Int32(UInt32(id))
        id += 1
        appDelegate.saveContext()
        print("Data Saved")
    }
    
    
    //MARK: Fetch Note Data
    func fetchNoteData(id : Int?){
        
    }
    
}
