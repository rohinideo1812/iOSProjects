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
    
    //Mark: Properties
    var notedata : NoteItem?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    //MARK: Insert Note Data
    func insertNoteData(object : NoteItem?) {
        print("Insert Note Data")
        let note = Note(context: appDelegate.persistentContainer.viewContext)
        if let title = object?.title {
            note.title = title
        }
        if let subtitle = object?.subtitle {
            note.subtitle = subtitle
        }
        if let image = object?.image{
            let imageToBeStored = UIImageJPEGRepresentation(image, 1)
            note.imageUrl = imageToBeStored
            
        }
        if let id = object?.id{
            note.id = id
        }
        if let date = object?.date{
            note.createDate = date
            note.modifyDate = date
        }
        if let remindDate = object?.remindDate{
            note.remindDate = remindDate
        }
        if let isPin = object?.isPin{
            note.isPin = isPin
        }
        if let isArchive = object?.isArchive{
            note.isArchive = isArchive
        }
        note.color = ""
        appDelegate.saveContext()
        print("Data Saved")
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
        var isPin : Bool
        var isArchive : Bool
        var remindDate : String?
        var id : String?
        
        if let getId = note.id{
            id = getId
        }
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
        
            isPin = note.isPin
            isArchive = note.isArchive
            remindDate = note.remindDate

        let noteItem = NoteItem(title: title, subtitle: subtitle,image: image,isPin: isPin,isArchive: isArchive,remindDate: remindDate,date: date,id: id)
        return noteItem
    }
    
    
    //Mark: Remove DB
    func removeNotesFromDB(){
        let context = appDelegate.persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }

    }
    
    //Mark: Update Note in DB
    func updateNoteData(id: String,object : NoteItem?){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        request.predicate = NSPredicate(format: "id = %@", (object?.id!)!)
        request.returnsObjectsAsFaults = false
        do {
            let result = try appDelegate.persistentContainer.viewContext.fetch(request) as! [Note]
            if result.count > 0{
                let updateNote = result[0]
                if let title = object?.title{
                    updateNote.setValue(title, forKey: "title")
                }
                if let subtitle = object?.subtitle{
                    updateNote.setValue(subtitle, forKey: "subtitle")
                }
                if let image = object?.image{
                    let imageToBeStored = UIImageJPEGRepresentation(image, 1)
                    updateNote.setValue(imageToBeStored, forKey: "imageUrl")
                }
                if let isPin = object?.isPin{
                    updateNote.setValue(isPin, forKey: "isPin")
                }
                if let date = object?.date{
                    updateNote.setValue(date, forKey: "modifyDate")
                }
                if let isArchive = object?.isArchive{
                    updateNote.setValue(isArchive, forKey: "isArchive")
                }
                if let remindDate = object?.remindDate{
                    updateNote.setValue(remindDate, forKey: "remindDate")
                }
            }
            appDelegate.saveContext()

        }catch {
            
            print("Failed")
        }
        
    }
    
}
