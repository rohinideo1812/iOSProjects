import Foundation
import UIKit
import UserNotifications
import SystemConfiguration


class AppUtil {
    
    static var shareInstance = AppUtil()
    private var currentUser:User?
    private var currentUserEmail:String?
    private init(){}
    private let userdefault = UserDefaults.standard
    var isTappedUserNotification = false

    
    func setUser(currentUser:User?){
        self.currentUser = currentUser
    }
    
    func getUser()-> User?{
        return self.currentUser
    }
  
    
    func setUserCredential(email:String?,password:String?){
        userdefault.set(email, forKey: Constants.CacheKeys.KEY_CURRENT_USER_EMAIL)
        userdefault.set(password, forKey: Constants.CacheKeys.KEY_CURRENT_USER_PASSWORD)
        
    }
    
    
    func getUserCredential() -> (email:String?,password:String?){
       let email = userdefault.string(forKey: Constants.CacheKeys.KEY_CURRENT_USER_EMAIL)
        let password = userdefault.string(forKey: Constants.CacheKeys.KEY_CURRENT_USER_PASSWORD)
        let credential = (email:email,password:password)
        return credential
    }
    
    func setFIRUserCredential(firUser:FIRUserModel){
        
        userdefault.set("\(firUser.firstName ?? "") \(firUser.lastName ?? "")", forKey: Constants.CacheKeys.KEY_CURRENT_FIR_USER_NAME)
        userdefault.set(firUser.email, forKey: Constants.CacheKeys.KEY_CURRENT_FIR_USER_EMAIL)
        userdefault.set(firUser.imageUrl, forKey:Constants.CacheKeys.KEY_CURRENT_FIR_USER_IMG_URL)
    }
    
    func getFIRUserCredential()->(email:String?,name:String?,imageUrl:String?){
        let email = userdefault.string(forKey: Constants.CacheKeys.KEY_CURRENT_FIR_USER_EMAIL)
        let name =  userdefault.string(forKey:Constants.CacheKeys.KEY_CURRENT_FIR_USER_NAME )
        let imageUrl = userdefault.string(forKey: Constants.CacheKeys.KEY_CURRENT_FIR_USER_IMG_URL)
        let credential = (email:email,name:name,imageUrl:imageUrl)
        return credential
    }
    
    func getMainVC()->MyNavigationController{
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardVC = storyBoard.instantiateViewController(withIdentifier: "DashBoardViewController") as!  DashBoardViewController
        dashboardVC.isTappedUserNotification = self.isTappedUserNotification
        let mymenuVC = MyMenuTableViewController()
        mymenuVC.delegate = dashboardVC
        let mynavVc = MyNavigationController(menuViewController: mymenuVC, contentViewController:dashboardVC)
        return mynavVc
    }
    
    
    func scheduleNotifications(notes:[NoteItem])->[NoteItem] {
        
        var noteObj : [NoteItem] = []

    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        

        for  noteObject in notes{
            if let reminderDate = noteObject.remindDate{
                let content = UNMutableNotificationContent()
                content.badge = 1
                content.sound = UNNotificationSound.default()
                let dateArray = reminderDate.components(separatedBy: ",")
                if dateArray[0] != "" && dateArray[1] != ""{
                    let stringDate = "\( dateArray[0]) \( dateArray[1])"
                     let repeatType = "\( dateArray[2])"
                    let date = stringDate.date(format: "yyyy-MM-dd hh:mm a")
                    if date!.timeIntervalSinceNow.sign == .plus {
                        let getDateComponent = getDateComponents(repeatType:repeatType,date:date)
                        let requestIdentifier = "\(noteObject.id!)"
                        content.title = "\(noteObject.title ?? "")"
                        content.subtitle = "\(noteObject.subtitle ?? "")"
                        DataManager.shared.convertNoteItemToJSONObject(object: noteObject, callback: {jsonObj in
                            content.userInfo = jsonObj
                        })
                        let trigger = UNCalendarNotificationTrigger(dateMatching: getDateComponent, repeats: true)
                        
                        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request) { (error:Error?) in
                            
                            if error != nil {
                                print("no error")
                            }
                        }
                        noteObj.append(noteObject)
                    }
                }
                
                    }
            
        }
        return(noteObj)
        
    }
    
    
    func getDateComponents(repeatType:String,date:Date?)->DateComponents{
        
        var dateComponent = DateComponents()
        
        
            switch repeatType {
                
            case Constants.repeatTypes.DOES_NOT_REPEAT:
                dateComponent = Calendar.current.dateComponents([.hour,.minute], from: date!)
                
            case Constants.repeatTypes.DAILY :
                dateComponent =  Calendar.current.dateComponents([.hour,.minute], from: date!)
                
            case Constants.repeatTypes.WEEKLY:
                dateComponent =  Calendar.current.dateComponents([.weekday,.hour,.minute], from: date!)
                
            case Constants.repeatTypes.MONTHLY:
                dateComponent =  Calendar.current.dateComponents([.month,.weekday,.hour,.minute], from: date!)
                
            case Constants.repeatTypes.YEARLY:
                dateComponent =  Calendar.current.dateComponents([.year,.month,.weekday,.hour,.minute], from: date!)
                
            default:
                break
            }
            return dateComponent
        
    }
    
    
     func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        return ret
    }
}

extension String{
    func date(format:String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from:self)
    }
}
