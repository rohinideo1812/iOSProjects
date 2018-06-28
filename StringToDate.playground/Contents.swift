//: Playground - noun: a place where people can play

import UIKit

//extension String{
//    func date(format:String) -> Date?{
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format
//        dateFormatter.timeZone = TimeZone.current
//        return dateFormatter.date(from:self)
//    }
//}
//
//let strDate = "2018-06-27,01:30 PM"
//let str = strDate.components(separatedBy: ",")
//let str2 = "\(str[0]) \(str[1])"
//print(str2)
//let date = str2.date(format: "yyyy-MM-dd hh:mm a")
//print(date)
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
let someDate = dateFormatter.date(from: "2018-06-27 04:33 PM")

//Get calendar
let calendar = NSCalendar.current

//Get just MM/dd/yyyy from current date
let components = calendar.dateComponents([.weekday,.month,.year,.hour,.minute], from: Date())

//Convert to NSDate
if someDate!.timeIntervalSinceNow.sign == .plus {
    
    print("future")
} else {
   print("before")
}

