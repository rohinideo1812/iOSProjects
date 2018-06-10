import Foundation
import UIKit




class DashBoardService {
    
    var userenteredString:String?

    func getNotes(noteType:NoteType,callBack:([NoteItem]) -> Void){
        
        let notes = NoteDataBase.sharedInstance.fetchNoteData()
        print("Notes-------------------------------",notes)
        let reminderNotes = notes.filter({$0.remindDate != nil && $0.isDelete == false})
        AppUtil.shareInstance.scheduleNotifications(notes:reminderNotes)
       
        switch noteType {
            
        case .notes : let note = notes.filter({$0.isDelete == false && $0.isArchive == false})
                      callBack(note)
            
        case .reminders :
            callBack(reminderNotes)
            
        case .archive : let archivedNotes = notes.filter({$0.isArchive == true && $0.isDelete == false })
            callBack(archivedNotes)
            
        case .delete : let deletedNotes = notes.filter({$0.isDelete == true})
            callBack(deletedNotes)
            
        case .search : if let containsString = userenteredString {
                      let searchNotes = notes.filter({($0.title?.contains("\(containsString)"))! || ($0.subtitle?.contains("\(containsString)"))!})
                      callBack(searchNotes)
            }
        }
    }
    
    func updateNoteData(object : NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        NoteDataBase.sharedInstance.updateNoteData(object: object,callback: {result,message in
            
            callback(result,message)
            
        })
    
    }
    
    func updateNotes(objects : [NoteItem],callback:(_ result:Bool,_ message:String)->Void){
        NoteDataBase.sharedInstance.updateNotes(objects: objects,callback: {result,message in
            
            callback(result,message)
            
        })
        
    }
    
}

