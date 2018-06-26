import Foundation

//Mark: Base Protocol for the View
protocol BaseView:NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func showMessage(message : String)

}

//Mark: Protocol used for sending reminder data back
protocol ReminderSetDelegate: class {
    func pressedCheckButton(info: String)
}

//Mark: Protocol used for detect event of selected menu item
protocol MenuDelegate {
    func sideMenuDidSelected(noteType:NoteType)
}

//Mark: Dashboard View Protocol
protocol DashBoardView:BaseView {
    func setNoteItems(notes: [NoteItem])
    func setEmptyNotes()
}

//Mark: Login View Protocol
protocol LoginView:BaseView {
    func openDashBoard()
    func messageAfterRegistration(message:String)

}

//Mark: Login View Protocol
protocol SignUpView:BaseView {
    func messageAfterRegistration(message:String)
}


//Mark: AddNote View Protocol
protocol AddNoteView:BaseView{
    
}

//Mark: Add Color Protocol
protocol ColorSelected {
    func colorSelected(color:String)
}



