import Foundation
import UIKit

class ViewUtil{
    
    static var shareInstance = ViewUtil()
    public init (){}
    
    //MARK:Alert Message Display
    func alertMessageDisplay(target:UIViewController, title : String , message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        target.present(alert, animated: true)
    }
    
//    func getSelectedItem(type:NoteType,target:UIViewController){
//        var barItems:[UIBarButtonItem] = []
//        switch type {
//        case .notes,.reminders,.archive:
//            let menuItem = UIBarButtonItem(image: <#T##UIImage?#>, style: <#T##UIBarButtonItemStyle#>, target: target, action: Selector(DashBoardViewController()))
//            break
//        case .delete:
//            break
//        case .search:
//            break
//        }
//
//    }
    
}
