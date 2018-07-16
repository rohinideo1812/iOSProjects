import Foundation


    class DashBoardPresenter {
  
        private let dashBoardService:DashBoardService
        var userEnteredString:String?
        weak private var dashBoardView : DashBoardView?
        
        init(dashBoardService:DashBoardService){
            self.dashBoardService = dashBoardService
        }
        
        func attachView(view:DashBoardView){
            dashBoardView = view
        }
        
        func detachView() {
            dashBoardView = nil
        }
        
        //Mark:Fetch Note from Local DB
        func getNotes(type:NoteType){
            dashBoardService.userenteredString = userEnteredString
            self.dashBoardView?.startLoading()
             dashBoardService.getNotes(noteType: type){ [weak self] notes in
                self?.dashBoardView?.finishLoading()
                if(notes.count == 0){
                    self?.dashBoardView?.setNoteItems(notes: [])
                }else{
                    self?.dashBoardView?.setNoteItems(notes: notes)
                    }
                }
            }
       
        //Mark:Update Note on Local DB
        func updateNote(object:NoteItem?){
            self.dashBoardView?.startLoading()
            dashBoardService.updateNoteData(object: object,callback: {result,message in
                print(message)
            })
        }
        
        
        //Mark:Update Notes on Local DB
        func updateNotes(objects:[NoteItem]){
            self.dashBoardView?.startLoading()
            dashBoardService.updateNotes(objects: objects,callback: {result,message in
                print(message)
            })
        }
        
//        //Mark: Update Notes For Firebase
//        func updateNotesWith(objects : [NoteItem]){
//            self.dashBoardView?.startLoading()
//            dashBoardService.updateNotesWith(objects: objects, callback: { result,message in
//                print(result)
//                print(message)
//
//            })
//        }
        
        //Mark: Update Notes For Firebase
        func updateNotesWith(objects : [NoteItem],callback:(_ result:Bool,_ message:String)->Void){
            self.dashBoardView?.startLoading()
            dashBoardService.updateNotesWith(objects: objects, callback: { result,message in
                callback(result,message)
            })
        }
  }

