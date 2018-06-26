import Foundation

struct Constants {
    
    struct CacheKeys {
        public static let FUNDOONTES = "fundoonote"
        public static let ADD_NOTE_VC = "addnotevc"
        public static let REMINDER_NOTE_VC = "remindernotevc"
        public static let KEY_CURRENT_USER_EMAIL = "current_user_email"
        public static let KEY_CURRENT_USER_PASSWORD = "current_user_password"
        public static let KEY_CURRENT_FIR_USER_NAME = "current_fir_user_name"
        public static let KEY_CURRENT_FIR_USER_EMAIL = "current_fir_user_email"
        public static let KEY_CURRENT_FIR_USER_IMG_URL = "current_fir_user_img_url"

        
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
        public static let YEARLY = "Yearly"
    }
    
    struct Message{
        public static let MSG_INTERNET_AVAILABLE = "Internet Available!"
        public static let MSG_INTERNET_NOT_AVAILABLE = "Internet Not Available!"
    }
    
    struct FBInfo{
        public static let PERMISSION:[String] = ["email","public_profile"]
        public static let GRAPH_PERMISSION:String = "first_name,last_name,picture,email"

    }
    
    struct Color {
        static let colorBackgroundGrey = "#E8E8E8"
        static let colorBackgroundYellowLight = "#FCBB04"
        static let colorIconTintGrey = "##6B6B6B"
        static let colorWhite = "#FFFFFF"
        static let colorGreenNormal = "#4CAF50"
        static let purple = "#b387ff"
        static let darkBlue = "#81b1ff"
        static let blue = "#7fd8ff"
        static let green = "#ccff90"
        static let teal = "#a7ffeb"
        static let pink = "#f8bbd0"
        static let brown = "#d8ccc9"
        static let grey = "#d0d8dd"
        static let white = "#fafafa"
        static let red = "#fb8a7f"
        static let orange = "#fdd180"
        static let yellow = "#ffff8c"
        enum NavBarColor:String{
            case brownDark = "#424949"
            case greyDark = "#5f7c8a"
            case yellowDark = "#FCBB04"
        }
    }
}

enum VCType{
    case login
    case dashboard
}
