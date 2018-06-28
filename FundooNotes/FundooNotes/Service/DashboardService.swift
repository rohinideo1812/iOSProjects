import Foundation
import UIKit


class DashBoardService {
    
    var userenteredString:String?

    //Mark:Fetch Note from Local DB
    func getNotes(noteType:NoteType,callBack:@escaping ([NoteItem]) -> Void){
        
         DataManager.shared.fetchNoteData(callback: {notes in
//        let notes = NoteDataBase.sharedInstance.fetchNoteData()
        
            let reminderNotes = notes.filter({$0.remindDate != "" && $0.isDelete == false})
       let upcomingReminderNotes = AppUtil.shareInstance.scheduleNotifications(notes:reminderNotes)
            
        switch noteType {
            
        case .notes : let note = notes.filter({$0.isDelete == false && $0.isArchive == false})
                      callBack(note)
            
        case .reminders :
            callBack(upcomingReminderNotes)
            
        case .archive : let archivedNotes = notes.filter({$0.isArchive == true && $0.isDelete == false })
            callBack(archivedNotes)
            
        case .delete : let deletedNotes = notes.filter({$0.isDelete == true})
            callBack(deletedNotes)
            
        case .search : if let containsString = self.userenteredString {
                      let searchNotes = notes.filter({($0.title?.contains("\(containsString)"))! || ($0.subtitle?.contains("\(containsString)"))!})
                      callBack(searchNotes)
            }
        }
              })
    }
    
    //Mark: Update Note On Local DB
    func updateNoteData(object : NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        NoteDataBase.sharedInstance.updateNoteData(object: object,callback: {result,message in
            
            callback(result,message)
            
        })
    
    }
    
    
    //Mark: Update Notes on Local DB
    func updateNotes(objects : [NoteItem],callback:(_ result:Bool,_ message:String)->Void){
        NoteDataBase.sharedInstance.updateNotes(objects: objects,callback: {result,message in
            
            callback(result,message)
            
        })
    }
    
    
    //Mark:Update Notes On Firebase
     func updateNotesWith(objects : [NoteItem],callback:(_ result:Bool,_ message:String)->Void){
        DataManager.shared.updateNotes(objects: objects, callback: { result,message in
            print(result)
            print(message)
            
        })
    
    }
}

