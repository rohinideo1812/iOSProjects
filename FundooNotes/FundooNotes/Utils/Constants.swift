import Foundation

struct Constants {
    
    struct CacheKeys {
        public static let FUNDOONTES = "fundoonote"
        public static let ADD_NOTE_VC = "addnotevc"
        public static let REMINDER_NOTE_VC = "remindernotevc"
        public static let KEY_CURRENT_USER_EMAIL = "current_user_email"
        public static let KEY_CURRENT_USER_PASSWORD = "current_user_password"
    }
    
    struct DatabseKeys {
        public static let FIRST_NAME = "firstName"
        public static let LAST_NAME = "lastName"
        public static let EMAIL_ID = "emailId"
        public static let PASSWORD = "password"

    }
    
    struct repeatTypes{
        public static let DOES_NOT_REPEAT = "Does not repeat"
        public static let DAILY = "Daily"
        public static let WEEKLY = "Weekly"
        public static let MONTHLY = "Monthly"
        public static let YEARLY = "yearly"
    }
    struct Message{
        public static let MSG_INTERNET_AVAILABLE = "Internet Available!"
        public static let MSG_INTERNET_NOT_AVAILABLE = "Internet Not Available!"
    }
    
    struct FBInfo{
        public static let PERMISSION:[String] = ["email","public_profile"]
        public static let GRAPH_PERMISSION:String = "first_name,last_name,picture,email"

    }
}

enum VCType{
    case login
    case dashboard
}
