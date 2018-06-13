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
        
        func updateNote(object:NoteItem?){
            self.dashBoardView?.startLoading()
            dashBoardService.updateNoteData(object: object,callback: {result,message in
                print(message)
            })
        }
        
        func updateNotes(objects:[NoteItem]){
            self.dashBoardView?.startLoading()
            dashBoardService.updateNotes(objects: objects,callback: {result,message in
                print(message)
            })
        }
        
}
