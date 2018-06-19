import Foundation


class AddNoteService{
    
    //Mark:Add Note on Local DB
    func addNote(object : NoteItem!,callback:(_ result:Bool,_ message:String)->Void){
        NoteDataBase.sharedInstance.insertNoteData(object: object,callback: {result,message in
            
            callback(result,message)
            
        })
    }
    
    //Mark:Update Note on Local DB
    func updateNoteData(object : NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        NoteDataBase.sharedInstance.updateNoteData(object: object,callback: {result,message in
            
            callback(result,message)
            
        })
    }
    
    //Mark:Store Note on Firebase
    func storeNoteData(object:NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        DataManager.shared.storeNoteData(object:object,callback:{
            result,message in
            
            callback(result,message)
        })
    }
    
    //Mark:Update Note in Firebase
    func updateNoteDataWith(object : NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        
        DataManager.shared.updateNoteDataWith(object: object, callback: {
            result,message in
            
           callback(result,message)
        })
    }
    
}

