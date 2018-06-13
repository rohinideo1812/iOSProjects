import Foundation
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

typealias JSONObject = [String:Any]
typealias JSONArray = [JSONObject]

class DataManager {
    
     public static let shared = DataManager()
     let ref = Database.database().reference(withPath: "Users").child((Auth.auth().currentUser?.uid)!)
     private init() {}
    
    
    func storeNoteData(object:NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        //if AppUtil.shareInstance.isConnectedToNetwork(){
        
        convertNoteItemToJSONObject(object:object, callback: { note in
        
        self.ref.child("notes").child((object?.id!)!).updateChildValues(note)

        })
       // }
        
            NoteDataBase.sharedInstance.insertNoteData(object: object, callback: {
                result,message in
                callback(result,message)
            })
    }
    
    
    func fetchNoteData(callback:@escaping (_ notes:[NoteItem])->Void){
        var notes:[NoteItem] = []
        ref.child("notes").observe(.value, with: { snapshot in
            for child in snapshot.children {
                if let snap = child as? DataSnapshot{
                    if let value = snap.value as? JSONObject{
                        notes.append(self.convertJSONObjectToNoteItem(jsonObj: value))
                    }

                }
                
            }
            callback(notes)

        })
    }
    
    
    func convertJSONObjectToNoteItem(jsonObj:JSONObject) -> NoteItem {
            var noteObj = NoteItem()
            if let title = jsonObj["title"] as? String {
                noteObj.title = title
            }
            if let subtitle = jsonObj["note"] as? String{
                noteObj.subtitle = subtitle
            }
            if let isPin = jsonObj["isPin"]  as? Bool{
                noteObj.isPin = isPin
            }
            if let isArchive = jsonObj["isArchive"] as? Bool{
                noteObj.isArchive = isArchive
            }
            if let remindDate = jsonObj["remindDate"] as? String{
                noteObj.remindDate = remindDate
            }
            if let date = jsonObj["date"] as? String{
                noteObj.date = date
            }
            if let id = jsonObj["id"] as? String{
                noteObj.id = id
            }
        if let isDelete = jsonObj["isDelete"] as? Bool{
            noteObj.isDelete = isDelete
        }
        
            return noteObj
        }
    
    
    func updateNoteDataWith(object : NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        
        convertNoteItemToJSONObject(object:object, callback: {note in
        
        self.ref.child("notes").child((object?.id!)!).updateChildValues(note)

        })
        
        NoteDataBase.sharedInstance.updateNoteData(object: object, callback: {
            result,message in
            callback(result,message)
        })
    }
    
    
    
    func convertNoteItemToJSONObject(object:NoteItem?,callback:@escaping (_ noteDict:[String:Any]) -> Void){
        
        var url = ""
        
        if let image = object?.image{
        uploadImage(image:image,id: object?.id,callback: { geturl in
            url = geturl!
            let note : [String:Any] = [
                "title" : object?.title ?? "",
                "note"  : object?.subtitle ?? "",
                "isPin" : object?.isPin ?? "",
                "isArchive" : object?.isArchive ?? "",
                "remindDate" : object?.remindDate ?? "",
                "date" : object?.date ?? "",
                "id" : object?.id ?? "",
                "isDelete" : object?.isDelete ?? "",
                "imageUrl" : url
            ]
            callback(note)
        })
        }
    }

    
    
    func uploadImage(image:UIImage,id:String?,callback:@escaping (_ url: String?) -> Void){
       
            let storageRef = Storage.storage().reference(withPath: "Users").child((Auth.auth().currentUser?.uid)!)
            storageRef.child("notes").child((id!))
            if let uploadData = UIImagePNGRepresentation(image){
                storageRef.putData(uploadData, metadata: nil, completion:
                    {(metadata, error) in
                        if error != nil {
                            storageRef.downloadURL { (url, error) in
                                if let downloadUrrl = url {
                                   callback(downloadUrrl.absoluteString)
                                }
                            }
                            
                        } else {
                           print("error")
                        }
                    })
                }
        }
 }

