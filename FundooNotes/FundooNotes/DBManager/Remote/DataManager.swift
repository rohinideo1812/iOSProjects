import Foundation
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage
import SDWebImage
import FBSDKLoginKit


typealias JSONObject = [String:Any]
typealias JSONArray = [JSONObject]

class DataManager {
    
     public static let shared = DataManager()
//     let ref = Database.database().reference(withPath: "Users").child((Auth.auth().currentUser?.uid)!)
    let ref = Database.database().reference(withPath: "Users")
     private init() {}
    
    
    //Mark:Store Note on Firebase
    func storeNoteData(object:NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        //if AppUtil.shareInstance.isConnectedToNetwork(){
        
        
        convertNoteItemToJSONObject(object:object, callback: { note in
        self.ref.child((Auth.auth().currentUser?.uid)!).child("notes").child((object?.id!)!).updateChildValues(note)

        })
        
            NoteDataBase.sharedInstance.insertNoteData(object: object, callback: {
                result,message in
                callback(result,message)
            })
    }
    
    
    //Mark:Fetch Note from Firebase
    func fetchNoteData(callback:@escaping (_ notes:[NoteItem])->Void){
        var notes:[NoteItem] = []
//        ref.child("notes").observe(.value, with: { snapshot in
//            for child in snapshot.children {
//                if let snap = child as? DataSnapshot{
//                    if let value = snap.value as? JSONObject{
//                        self.convertJSONObjectToNoteItem(jsonObj: value, callback: { note in
//                            notes.append(note)
//                        })
//                    }
//                }
//            }
//
//            callback(notes)
//        })
//        ref.removeAllObservers()
//
//    }
        ref.keepSynced(true)
        ref.child((Auth.auth().currentUser?.uid)!).child("notes").observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                if let snap = child as? DataSnapshot{
                if let value = snap.value as? JSONObject{
                self.convertJSONObjectToNoteItem(jsonObj: value, callback: { note in
                            notes.append(note)
                        })
                    }
                }
            }
        callback(notes)
         })
    }
//        ref.child((Auth.auth().currentUser?.uid)!).child("notes").observeSingleEvent(of: .childAdded, with: { (snapshot) in
//                for child in snapshot.children {
//                    if let snap = child as? DataSnapshot{
//                        if let value = snap.value as? JSONObject{
//                            self.convertJSONObjectToNoteItem(jsonObj: value, callback: { note in
//                                notes.append(note)
//                            })
//                        }
//                    }
//                }
//           callback(notes)
//          })
    
    
    //Mark:Convert JSONObject To NoteItem
    func convertJSONObjectToNoteItem(jsonObj:JSONObject,callback:(_ note : NoteItem) -> Void) {
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
            if let imageHeight = jsonObj["imageHeight"] as? CGFloat{
            noteObj.imageHeight = imageHeight
            }
            if let imageWidth = jsonObj["imageWidth"] as? CGFloat{
            noteObj.imageWidth = imageWidth
            }
            if let color = jsonObj["color"] as? String{
            noteObj.color = color
            }
            if let imageUrl = jsonObj["imageUrl"]as? String{
                noteObj.imageUrl = imageUrl
            }
            callback(noteObj)

//                UIImageView().sd_setImage(with: URL(string:imageUrl), completed: { (image, error, type, url) in
//                    noteObj.image = image
//
//                })
                
        
    }
    
    func convertJSONObjToUserData(jsonObj:JSONObject,callback:(_ user : FIRUserModel) -> Void){
        var userData = FIRUserModel()
        if let firstName = jsonObj["firstName"] as? String{
            userData.firstName = firstName
        }
        if let lastName = jsonObj["lastName"] as? String{
         userData.lastName = lastName
        }
        if let email = jsonObj["email"] as? String{
            userData.email = email
            
        }
        if let imageUrl = jsonObj["imageUrl"] as? String{
            userData.imageUrl = imageUrl
        }
        callback(userData)
    }
    
    //Mark:Update Note In FireBase
    func updateNoteDataWith(object : NoteItem?,callback:(_ result:Bool,_ message:String)->Void){
        
        convertNoteItemToJSONObject(object:object, callback: {note in
        self.ref.child((Auth.auth().currentUser?.uid)!).child("notes").child((object?.id!)!).updateChildValues(note)

        })
        
        NoteDataBase.sharedInstance.updateNoteData(object: object, callback: {
            result,message in
            callback(result,message)
        })
    }
    
    
    func deleteNoteDataWith(objects : [NoteItem],callback:(_ result:Bool,_ message:String)->Void){
       
        for note in objects{
            self.ref.child((Auth.auth().currentUser?.uid)!).child("notes").child((note.id!)).removeValue()
        }
        
        callback(true,"Deleted SuccessFully")

    }
        
            
    func fetchUserData(callback:@escaping (_ userdata:FIRUserModel)->Void){
        var userData:[UserModel] = []
        ref.child((Auth.auth().currentUser?.uid)!).child("userInfo").observe(.value, with: { (snapshot) in
            for child in snapshot.children {
                if let snap = child as? DataSnapshot{
                    if let value = snap.value as? JSONObject{
                        self.convertJSONObjToUserData(jsonObj:value,callback:{userData in
                            callback(userData)
                        })
                        }
                    }
                }
            })
    }
    
    
    func convertNoteItemToJSONObject(object:NoteItem?,callback:@escaping (_ noteDict:[String:Any]) -> Void){
        
        var note:[String:Any] = [
                "title" : object?.title ?? "",
                "note"  : object?.subtitle ?? "",
                "isPin" : object?.isPin ?? "",
                "isArchive" : object?.isArchive ?? "",
                "remindDate" : object?.remindDate ?? "",
                "date" : object?.date ?? "",
                "id" : object?.id ?? "",
                "isDelete" : object?.isDelete ?? "",
                "color" : object?.color ?? "",
            ]
        
        if let image = object?.image{
            uploadImage(image:image,id: object?.id,callback: { geturl in
                note["imageUrl"] = geturl
                note["imageHeight"] = object?.image?.size.height
                note["imageWidth"] = object?.image?.size.width
                callback(note)
            })
        } else {
            note["imageUrl"] = nil
            note["imageHeight"] = nil
            note["imageWidth"] = nil
            callback(note)
        }
    }

    
    //Mark:Upload Note On FireBase
    func uploadImage(image:UIImage,id:String?,callback:@escaping (_ url: String?) -> Void){
       
            let storageRef = Storage.storage().reference(withPath: "Users").child((Auth.auth().currentUser?.uid)!)
            storageRef.child("notes").child((id!))
            if let uploadData = UIImagePNGRepresentation(image){
                storageRef.putData(uploadData, metadata: nil, completion:
                    {(metadata, error) in
                        if error == nil {
                            storageRef.downloadURL { (url, error) in
                                if let downloadUrl = url{
                                   callback(downloadUrl.absoluteString)
                            }
                         }
                        } else {
                            print(error ?? "")
                        }
                    })
                }
        }
    
    
    //Mark: Update Notes On Firebase
    func updateNotes(objects : [NoteItem],callback:(_ result:Bool,_ message:String)->Void){
        
        for note in objects{
            updateNoteDataWith(object : note, callback : { result,message in
                print(result)
                print(message)
            })
        }
        callback(true, "Updated")
        
    }
    
    func signOut(callback:@escaping (_ result:Bool,_ message:String)->Void){
            do {
                try Auth.auth().signOut()
                callback(true,"Successfully signed out")
            } catch (let error) {
                callback(false,"Auth sign out failed: \(error.localizedDescription)")
            }
        
        print(Auth.auth().currentUser?.uid)
    }
    
    
    func convertUserObjectToJSONObject(object:UserModel?,callback:@escaping (_ userDict:[String:Any]) -> Void){
        let userInfo:[String:Any] = [
            "firstName" : object?.firstName ?? "",
            "lastName" : object?.lastName ?? "",
            "email" : object?.email ?? "",
            "password" : object?.password ?? "",
            "imageUrl" : object?.imageUrl ?? ""
        ]
        callback(userInfo)
    }

    
    func storeUserData(object:UserModel?,callback:(_ result : Bool,_ message:String) -> Void){
        convertUserObjectToJSONObject(object: object, callback: {userInfo in
            self.ref.child((Auth.auth().currentUser?.uid)!).child("userInfo").updateChildValues(userInfo)
        })
    }
    
    func storeFIRUserData(firUser:[String:Any],callback:(_ result : Bool,_ message:String) -> Void){
        self.ref.child((Auth.auth().currentUser?.uid)!).child("userInfo").updateChildValues(firUser)
        callback(true,"Successfull Login")
    }
 }

