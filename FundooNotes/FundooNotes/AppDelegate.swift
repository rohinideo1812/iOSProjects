import UIKit
import CoreData
import UserNotifications
import Firebase
import FirebaseAuth
import FBSDKCoreKit
import FirebaseDatabase
import FirebaseCore


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?
    var user:User?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //checkLogedIn()
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
      FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)

        if Auth.auth().currentUser != nil {
            let mainVC = AppUtil.shareInstance.getMainVC()
            self.window?.rootViewController = mainVC
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.window?.rootViewController = newViewController
        }
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound],completionHandler: { (granted,error) in
            print(granted)
            UNUserNotificationCenter.current().delegate = self
            // Override point for customization after application launch.
            
        })
        return true

    }

    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
      let data = response.notification.request.content.userInfo
        AppUtil.shareInstance.isTappedUserNotification = true
        let mainVC = AppUtil.shareInstance.getMainVC()
        self.window?.rootViewController = mainVC
        completionHandler()
        
    }
        
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert,.badge,.sound])
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        UIApplication.shared.applicationIconBadgeNumber = 0

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app,
                                                                            open: url,
                                                                            sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?,
                                                                            annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    
        return handled
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "FundooNotes")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func checkLogedIn(){
        let getEmail = AppUtil.shareInstance.getUserCredential().email
        let getPassword = AppUtil.shareInstance.getUserCredential().password

      if let checkEmail = getEmail, let checkPassword = getPassword{
                UserDataBase.sharedInstance.checkUser(email: checkEmail,password: checkPassword,callback: {isavailable,object in
                    if isavailable{
                     setRootViewController(vcType: .dashboard)
                    }else {
                        setRootViewController(vcType: .login)

                    }
                })
            }
        }
    
    func setRootViewController(vcType:VCType){
     let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        switch vcType {
        case .login:
                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        self.window?.rootViewController = newViewController
        case .dashboard:
                        let mainVC = AppUtil.shareInstance.getMainVC()
                        self.window?.rootViewController = mainVC

                }
        }
}

