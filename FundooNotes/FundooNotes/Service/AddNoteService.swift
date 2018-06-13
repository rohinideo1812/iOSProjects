import Foundation


class AddNoteService{
    
    func addNote(object : NoteItem!,callback:(_ result:Bool,_ message:String)->Void){
        NoteDataBase.sharedInstance.insertNoteData(object: object,callback: {result,message in
            
            callback(result,message)
            
        })
    }
    
    func updateNoteData(object : NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        NoteDataBase.sharedInstance.updateNoteData(object: object,callback: {result,message in
            
            callback(result,message)
            
        })
    }
    
    func storeNoteData(object:NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        DataManager.shared.storeNoteData(object:object,callback:{
            result,message in
            
            callback(result,message)
        })
    }
    
    func updateNoteDataWith(object : NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        
        DataManager.shared.updateNoteDataWith(object: object, callback: {
            result,message in
            
           callback(result,message)
        })
    }
    
}

