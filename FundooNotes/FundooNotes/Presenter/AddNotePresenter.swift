import Foundation



class AddNotePresenter {
    private let addNoteService:AddNoteService
    weak private var addNoteView : AddNoteView?
    
    
    init(addnoteService:AddNoteService){
        self.addNoteService = addnoteService
    }
    
    func attachView(view:AddNoteView){
        addNoteView = view
    }
    
    func detachView() {
        addNoteView = nil
    }
    
    //Mark:Add Note on Local DB
    func addNote(object : NoteItem?){
        self.addNoteView?.startLoading()
        addNoteService.addNote(object: object){result,message in
            print(message)
        }
    }
    
    //Mark:Update Note on Local DB
    func updateNote(object:NoteItem?){
        self.addNoteView?.startLoading()
        addNoteService.updateNoteData(object: object,callback: {result,message in
            print(message)
        })
    }
    
    //Mark:Store Note on Local DB
    func storeNoteData(object:NoteItem?){
        self.addNoteView?.startLoading()
        addNoteService.storeNoteData(object: object, callback: {
            result,message in
            print(message)
        })
    }

    //Mark:Update Note on Firebase
    func updateNoteDataWith(object : NoteItem?){
        self.addNoteView?.startLoading()
        addNoteService.updateNoteDataWith(object: object, callback: {
            result,message in
            print(result)
            print(message)
            
        })
    }
}
