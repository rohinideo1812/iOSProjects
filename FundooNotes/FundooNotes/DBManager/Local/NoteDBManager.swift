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
    var id = 1

    
    var notedata : NoteModel?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    //MARK: Insert Note Data
    func insertNoteData(object : NoteModel?) {
        print("Insert Note Data")

        let note = Note(context: appDelegate.persistentContainer.viewContext)
        if let title = object?.title {
            note.title = title
        }
        if let subtitle = object?.note {
            note.subtitle = subtitle
        }
        if let image = object?.image{
            let imageToBeStored = UIImageJPEGRepresentation(image, 1)
            note.imageUrl = imageToBeStored
            
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
        print(id)
    }
    
    
    //MARK: Fetch Note Data
    func fetchNoteData()->[NoteItem]{
        var notes = [NoteItem]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        request.returnsObjectsAsFaults = false
        do {
        let result = try appDelegate.persistentContainer.viewContext.fetch(request) as! [Note]
            for data in result{
                let noteobj =  getNoteObject(note : data)
                notes.append(noteobj)
            }
        } catch {
            print("Failed")
        }
        return notes
    }
    
    
    //Mark: Get Note Object
    func getNoteObject(note : Note)->NoteItem{
        var title : String?
        var subtitle : String?
        var image : UIImage?
        var date : String?
        if let getTitle = note.title{
            title = getTitle
        }
        if let getSubtitle = note.subtitle{
            subtitle = getSubtitle

        }
        if let getimage = note.imageUrl{
            image = UIImage(data: getimage)
        }
        if let getDate = note.createDate{
            date = getDate
        }
        let noteItem = NoteItem(title: title, image: image, date: date, subtitle: subtitle)
        return noteItem
    }
    
}
