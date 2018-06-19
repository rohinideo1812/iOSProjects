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
    func insertNoteData(object : NoteItem?,callback:(_ result:Bool,_ message:String)->Void) {
        if let user = AppUtil.shareInstance.getUser(){
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
            if let isDelete = object?.isDelete{
                note.isDelete = isDelete
            }
            
            note.user = user
            note.color = ""
            appDelegate.saveContext()
            print("Data Saved")
            callback(true,"Note Added SuccessFully")
        }
        
    }
    
    
    //MARK: Fetch Note Data
    func fetchNoteData()->[NoteItem]{
        if let user = AppUtil.shareInstance.getUser(){
            var notes = [NoteItem]()
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            request.predicate = NSPredicate(format: "user = %@",user)
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

        }else{
                return []
            }
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

        let noteItem = NoteItem(title: title, subtitle: subtitle,image: image,isPin: isPin,isArchive: isArchive,remindDate: remindDate,date: date,id: id,isDelete : false)
        return noteItem
    }
    
    
    //Mark: Remove DB
    func removeNotesFromDB(){
        if let user = AppUtil.shareInstance.getUser(){
            let context = appDelegate.persistentContainer.viewContext
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            deleteFetch.predicate = NSPredicate(format: "user = %@",user)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            do {
                try context.execute(deleteRequest)
                try context.save()
            } catch {
                print ("There was an error")
            }
      }
    }
    
    
    func updateNotes(objects : [NoteItem],callback:(_ result:Bool,_ message:String)->Void){
        
        for note in objects{
            updateNoteData(object: note, callback: { success,message in
                print(success)
            })
        }
        callback(true, "Updated")
        
    }

    
    //Mark: Update Note in DB
    func updateNoteData(object : NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        if let user = AppUtil.shareInstance.getUser(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        request.predicate = NSPredicate(format: "user = %@ && id=%@",user,(object?.id!)!)
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
                if let delete = object?.isDelete{
                    updateNote.setValue(delete, forKey: "isDelete")
                }
            }
            appDelegate.saveContext()
            callback(true,"Note Updated Successfully")
        }catch {
            
            print("Failed")
        }
        }
    }
    
    
    
}




